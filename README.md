# E-commerce-Consumer-Behavior-SPSS-PROJECT
# Overview
This project explores the E-commerce Customer Behaviour Dataset provided on [Kaggle by Laksika Tharmalingam](https://www.kaggle.com/datasets/uom190346a/e-commerce-customer-behavior-dataset). This dataset provides a comprehensive view of customer behaviour within an e-commerce platform. Each entry in the dataset corresponds to a unique customer, offering a detailed breakdown of their interactions and transactions. The information is crafted to facilitate a nuanced analysis of customer preferences, engagement patterns, and satisfaction levels, enabling businesses to make data-driven decisions that enhance the customer experience. <br />

Visualisations can be found [Here](https://omoredeiguma.github.io/Website-Hosting-E-Commerce.github.io/)

Note: This dataset was synthetically generated for illustrative purposes, and any resemblance to real individuals or scenarios is coincidental. <br />

The transformed dataset, syntax and the raw SPSS output file are presented above, along with the results and discussion in a Word document formatted in APA 7th edition, which provides an in-depth analysis of the findings. Below this README file is a summary of the conclusions and recommendations based on the results obtained from the dataset.<br />

# Data Preparation
An age category variable measured on an ordinal scale was created using the Age variable, while Gender, Discount Applied, Membership Type, and Satisfaction level were recoded into different variables measured on a nominal and ordinal scale, respectively. <br />
The descriptive statistics option was used to check for missing values in the dataset. The variable "Satisfaction level" had 2 missing cases, which were replaced using the mode (the most frequent). Furthermore, the variable Total Spent was not normally distributed in order to conduct an independent samples t-test, so an Inverse Normal Transformation was done to achieve normality.

# Objectives
Objective 1: Descriptive statistics for Age Category, Membership Type, and Satisfaction Level. This was achieved using frequency count, mean, and percentages. <br />

Objective 2: Customer Segmentation. This involved the use of the elbow method and K-means cluster analysis. The elbow method was used to determine the optimal number of clusters for the K-Means Cluster Analysis. <br />

Objective 3: Relationship Between Gender and Membership Type. This was achieved using a chi-square test for independence to examine if there is a significant relationship between gender and membership type. <br />

Objective 4: Relationship Between Demographics and Spending between the variables total spent and age category. This was achieved using a one-way analysis of variance test. <br />

Objective 5: Customer Satisfaction Analysis. This involved using a chi-square test for independence to examine if there is a significant relationship between satisfaction level and membership type. <br />

Objective 6: Effect of Discounts on Purchase Behaviour. This was achieved using an independent samples t-test to compare the average total spent between customers who received a discount versus those who did not. <br />

Objective 7: Retention Analysis. This was achieved using Spearman's rank correlation analysis to study the relationship between the days since the last purchase, satisfaction level and membership type.

# Tools I Used
* IBM SPSS 27
* Microsoft Word <br />

# Hypothesis Testing
* Is there a significant association between gender and membership type? <br />
  H<sub>0</sub>: There is no significant difference between gender and membership type. <br />
  H<sub>1</sub>: There is a significant difference between gender and membership type. <br />
  
* Is there a significant difference in the means for total spending and age category? <br />
  H<sub>0</sub>: The means are equal for total spend and age category.  <br />
  H<sub>1</sub>: The means are different for total spending and age category.  <br />

* Is there a significant difference between satisfaction level and membership type? <br />
  H<sub>0</sub>: There is no significant difference between satisfaction level and membership type. <br />
  H<sub>1</sub>: There is a significant difference between satisfaction level and membership type. <br />

* Is there a significant difference between total spending and the discount applied? <br />
   H<sub>0</sub>: There is no significant difference between total spend and discount applied. <br />
   H<sub>1</sub>: There is a significant difference between total spend and discount applied. <br />

* Is there a significant relationship between days since the last purchase, membership type, and satisfaction level? <br />
   H<sub>0</sub>: No significant relationships between days since the last purchase, membership type, and satisfaction level. <br />
   H<sub>1</sub>: Significant relationships between days since last purchase, membership type, and satisfaction level. <br />

# Insights
Objective 1: From the descriptive statistics, of the 350 samples, 63.7% of the customers were in the age range 31-39, and there was an equal distribution of gender (50%). Bronze, silver, and gold membership subscribers were split evenly(33.4%), (33.4%) and (33.4%) respectively. The majority of the customers were satisfied (36.3%) <br />

Objective 2: Two customer clusters were identified based on age, items purchased, and total spending:
* Cluster 1: Older customers (avg. age 35) with the lowest spending.
* Cluster 2: Younger customers (avg. age 30) with the highest spending.
Younger customers tend to spend more; therefore, targeted promotions should focus on this high-spending group. For older customers (Cluster 2), marketing strategies should be developed to encourage more spending and larger purchases. accordingly​ <br />

Objective 3: A significant relationship was found between gender and membership type. Female customers are more likely to have Bronze memberships, while males are more likely to have Gold memberships. The company should focus on designing gender-specific membership upgrade strategies <br />

Objective 4: Younger customers (20-29) tend to spend more than older ones. Marketing strategies such as loyalty programs and exclusive discounts could help retain these high-spending younger customers, while additional incentives may be needed to encourage spending in the older groups. <br />

Objective 5: Gold members are more likely to report satisfaction, while Bronze and Silver members report lower satisfaction levels. The company should consider enhancing the experience for Bronze and Silver members to improve satisfaction and retention. <br />

Objective 6: There was no significant difference in the total amount spent for Customers who received a discount ($821.40) and those who did not receive a discount ($868.99). This indicates that discounts do not affect the spending habits of consumers. <br />

Objective 7: A positively significant correlation was found between satisfaction level and days since the last purchase (rs = .747, *p* <.001). It could be that satisfied customers don’t feel pressured to buy frequently, and thus, they may only return when they really need something, but still report high satisfaction. A correlation between membership type and days since the last purchase was negative and significant (rs = -.476, *p* <.001), indicating that higher-tier members (Gold) purchase more often. Membership type and satisfaction level were negative and significant (rs = -.733, *p* <.001. A possible explanation could be that gold members may expect VIP treatment, so even minor inconveniences may lower their satisfaction more than bronze members. <br />

# Hypothesis Test Results
 * Is there a significant association between gender and membership type? <br />
  -Based on the chi-square test, we reject the null hypothesis and conclude that there was a significant association between gender and membership type <br />

* Is there a significant difference in the means for total spending and age category? <br />
  -From the ANOVA result, we reject the null hypothesis and conclude that the means for total spending across the different age categories were different. <br />
  
* Is there a significant association between satisfaction level and membership type? <br />
  -We reject the null hypothesis and conclude that there was a significant association between satisfaction level and membership type. <br />
  
* Is there a significant difference between the total spent and the discount applied? <br />
  -The null hypothesis was retained based on the t-test result, indicating that there was no significant difference between total spending and the discount applied. <br />
  
* Is there a significant relationship between days since the last purchase, membership type, and satisfaction level? <br />
  -From the correlation analysis, we reject the null hypothesis and conclude that there was a significant relationship between days since the last purchase, membership type, and satisfaction level. Although this does not imply causation.
