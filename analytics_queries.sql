-- ============================================
-- ADVANCED ANALYTICS QUERIES
-- DONATION & FUNDRAISING SYSTEM
-- ============================================


------------------------------------------------
-- 1. Campaign Progress: % of Target Reached
------------------------------------------------
SELECT c.campaign_id,
       c.title,
       c.target_amount,
       NVL(SUM(d.amount), 0) AS total_raised,
       ROUND(NVL(SUM(d.amount), 0) / c.target_amount * 100, 2) AS percent_completed
FROM campaign c
LEFT JOIN donation d 
    ON c.campaign_id = d.campaign_id
GROUP BY c.campaign_id, c.title, c.target_amount;



------------------------------------------------
-- 2. Top Donor by Total Contribution
------------------------------------------------
SELECT u.user_id,
       u.first_name || ' ' || u.last_name AS donor_name,
       SUM(d.amount) AS total_donated
FROM users u
JOIN donation d 
    ON u.user_id = d.donor_id
GROUP BY u.user_id, u.first_name, u.last_name
ORDER BY total_donated DESC
FETCH FIRST 1 ROW ONLY;



------------------------------------------------
-- 3. Daily Donations With Running Total
------------------------------------------------
SELECT donation_date,
       SUM(amount) AS daily_total,
       SUM(SUM(amount)) OVER (ORDER BY donation_date) AS running_total
FROM donation
GROUP BY donation_date
ORDER BY donation_date;



------------------------------------------------
-- 4. Ranking Campaigns by Total Donations
------------------------------------------------
SELECT campaign_id,
       SUM(amount) AS total_raised,
       RANK() OVER (ORDER BY SUM(amount) DESC) AS donation_rank
FROM donation
GROUP BY campaign_id;



------------------------------------------------
-- 5. Average Donation Per Donor (Min 2 Donations)
------------------------------------------------
SELECT donor_id,
       AVG(amount) AS avg_donation
FROM donation
GROUP BY donor_id
HAVING COUNT(donation_id) >= 2;



------------------------------------------------
-- 6. Beneficiary Financial Summary
--    Donations vs Disbursements
------------------------------------------------
SELECT b.beneficiary_id,
       b.name,
       COALESCE(SUM(dn.amount), 0) AS total_donated_to_campaigns,
       COALESCE(SUM(db.amount), 0) AS total_disbursed,
       COALESCE(SUM(dn.amount), 0) - COALESCE(SUM(db.amount), 0) AS net_balance
FROM beneficiary b
LEFT JOIN campaign c 
    ON b.beneficiary_id = c.beneficiary_id
LEFT JOIN donation dn 
    ON c.campaign_id = dn.campaign_id
LEFT JOIN disbursement db
    ON c.campaign_id = db.campaign_id
GROUP BY b.beneficiary_id, b.name;



------------------------------------------------
-- 7. Most Active Donors
------------------------------------------------
SELECT donor_id,
       COUNT(DISTINCT campaign_id) AS campaigns_supported
FROM donation
GROUP BY donor_id
ORDER BY campaigns_supported DESC;



------------------------------------------------
-- 8. Campaigns With No Donations
------------------------------------------------
SELECT c.campaign_id, c.title
FROM campaign c
WHERE NOT EXISTS (
    SELECT 1 
    FROM donation d 
    WHERE d.campaign_id = c.campaign_id
);
