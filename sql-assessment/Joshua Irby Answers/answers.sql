-- answer challenge 1
select date, sum(impressions) as total_impressions
from marketing_data
group by date
order by date;

-- answer to challenge 2
select state, sum(revenue) as total_revenue
from website_revenue
group by state
order by total_revenue desc;
-- limit 3; if you want to see the top 3 performing states

-- answer to challenge 3
select ci.name, 
       SUM(md.cost) as total_cost,
       SUM(md.impressions) as total_impressions,
       SUM(md.clicks) as total_clicks,
       SUM(wr.revenue) as total_revenue
from campaign_info ci
join marketing_data md on ci.id = md.campaign_id
join website_revenue wr on ci.id = wr.campaign_id
group by name;

-- answer to challenge 4
select wr.state, sum(md.conversions) as total_conversions
from marketing_data md
join website_revenue wr on md.campaign_id = wr.campaign_id
join campaign_info ci on md.campaign_id = ci.id
where ci.name = 'Campaign5'
group by wr.state
order by total_conversions desc;
-- limit 1; if you want to only display the top performing state

-- answer to challenge 5
select ci.name,
	sum(wr.revenue)/sum(md.cost) as roi
from campaign_info ci
join marketing_data md on ci.id = md.campaign_id
join website_revenue wr on ci.id = wr.campaign_id
group by ci.id
order by roi desc;
-- the best performing campaign based on money made vs. money spent (roi) is campaign 4
-- you could do the same operation for clicks, impressions, or conversions vs. money spent, but revenue is a better positive measure.

-- answer to bonus challenge
select dayname(date) as weekday,
avg(impressions) as avg_impressions
from marketing_data
group by weekday
order by avg_impressions desc;
-- this does not give data for specific ads, but thursday is the best day of the week for overall ad impressions
