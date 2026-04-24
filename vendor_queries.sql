/* =========================================
    PROJECT: Vendor Performance Analysis
   ========================================= */

-- Drop table if exists
IF OBJECT_ID('vendor_sales_summary', 'U') IS NOT NULL
    DROP TABLE vendor_sales_summary;

;WITH FreightSummary AS (
    SELECT 
        VendorNumber,
        SUM(Freight) AS FreightCost
    FROM vendor_invoice
    GROUP BY VendorNumber
),

PurchaseSummary AS (
    SELECT 
        p.VendorNumber,
        LTRIM(RTRIM(p.VendorName)) AS VendorName,
        p.Brand,
        LTRIM(RTRIM(p.Description)) AS Description,
        p.PurchasePrice,
        pp.Price AS ActualPrice,
        pp.Volume,

        SUM(p.Quantity) AS TotalPurchaseQuantity,
        SUM(p.Dollars) AS TotalPurchaseDollars

    FROM purchases p
    JOIN purchase_prices pp
        ON p.Brand = pp.Brand

    WHERE p.PurchasePrice > 0

    GROUP BY 
        p.VendorNumber,
        p.VendorName,
        p.Brand,
        p.Description,
        p.PurchasePrice,
        pp.Price,
        pp.Volume
),

SalesSummary AS (
    SELECT 
        VendorNo,
        Brand,

        SUM(SalesQuantity) AS TotalSalesQuantity,
        SUM(SalesDollars) AS TotalSalesDollars,
        SUM(SalesPrice) AS TotalSalesPrice,
        SUM(ExciseTax) AS TotalExciseTax

    FROM sales
    GROUP BY VendorNo, Brand
),

FinalData AS (
    SELECT 
        ps.*,

        ISNULL(ss.TotalSalesQuantity,0) AS TotalSalesQuantity,
        ISNULL(ss.TotalSalesDollars,0) AS TotalSalesDollars,
        ISNULL(ss.TotalSalesPrice,0) AS TotalSalesPrice,
        ISNULL(ss.TotalExciseTax,0) AS TotalExciseTax,
        ISNULL(fs.FreightCost,0) AS FreightCost

    FROM PurchaseSummary ps

    LEFT JOIN SalesSummary ss
        ON ps.VendorNumber = ss.VendorNo
        AND ps.Brand = ss.Brand

    LEFT JOIN FreightSummary fs
        ON ps.VendorNumber = fs.VendorNumber
)

-- Final output
SELECT 
    *,

    -- Gross Profit
    (TotalSalesDollars - TotalPurchaseDollars) AS GrossProfit,

    -- Profit Margin
    CASE 
        WHEN TotalSalesDollars = 0 THEN 0
        ELSE (TotalSalesDollars - TotalPurchaseDollars) * 100.0 / TotalSalesDollars
    END AS ProfitMargin,

    -- Stock Turnover
    CASE 
        WHEN TotalPurchaseQuantity = 0 THEN 0
        ELSE TotalSalesQuantity * 1.0 / TotalPurchaseQuantity
    END AS StockTurnover,

    -- Sales to Purchase Ratio
    CASE 
        WHEN TotalPurchaseDollars = 0 THEN 0
        ELSE TotalSalesDollars * 1.0 / TotalPurchaseDollars
    END AS SalesToPurchaseRatio

INTO vendor_sales_summary

FROM FinalData;

SELECT * FROM vendor_sales_summary;