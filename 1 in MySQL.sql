show databases;

create database eproject1;
use eproject1;

select * from Finance_1;
desc Finance_1;

select * from Finance_2;
desc Finance_2;

# kpi 1
select year(str_to_date(Finance_1.issue_d,'%d-%m-%Y')) years, concat(format(sum(Finance_1.loan_amnt)/1000000,0),"M") as Total_Loan_amount
from Finance_1 join Finance_2
on Finance_1.id=Finance_2.id
group by year(str_to_date(Finance_1.issue_d,'%d-%m-%Y'))
order by years;

# kpi 2
select finance_1.grade , finance_1.sub_grade , concat(format(sum(finance_2.revol_bal)/1000000,0),"M") as Toatl_Revolve_balance
from finance_1 join finance_2
on finance_1.id=finance_2.id
group by finance_1.grade , finance_1.sub_grade 
order by finance_1.grade , finance_1.sub_grade ;

# kpi 3
select finance_1.verification_status , concat(format(sum(finance_2.total_pymnt)/1000000,0),"M") as Total_Payment
from finance_1 join finance_2
on finance_1.id=finance_2.id
where finance_1.verification_status != "source verified"
group by finance_1.verification_status;

# kpi 4
select finance_1.addr_state , finance_2.last_credit_pull_d,finance_1.loan_status , count(*) as total_loans
from finance_1 join finance_2
on finance_1.id=finance_2.id
group by finance_1.addr_state , finance_2.last_credit_pull_d,finance_1.loan_status 
order by finance_1.addr_state ;

# kpi 5
select finance_1.home_ownership , max(issue_d)
from finance_1 join finance_2
on finance_1.id=finance_2.id
group by finance_1.home_ownership;

# kpi 6
select finance_1.purpose ,concat(format(sum(Finance_1.loan_amnt)/1000000,0),"M") as Total_Loan_amount
from finance_1 join finance_2
on finance_1.id=finance_2.id
group by finance_1.purpose;

# kpi 7
select finance_1.emp_length ,concat(format(sum(Finance_1.loan_amnt)/1000000,0),"M") as Total_Loan_amount
from finance_1 join finance_2
on finance_1.id=finance_2.id
group by finance_1.emp_length;

# kpi 8
select finance_1.home_ownership ,concat(format(sum(Finance_1.loan_amnt)/1000000,0),"M") as Total_Loan_amount
from finance_1 join finance_2
on finance_1.id=finance_2.id
group by finance_1.home_ownership;

# kpi 9
select finance_1.verification_status ,format(sum(finance_2.total_acc),0) as Total_accounts
from finance_1 join finance_2
on finance_1.id=finance_2.id
group by finance_1.verification_status;

# kpi 10
select finance_1.term ,concat(format(sum(Finance_1.loan_amnt)/1000000,0),"M") as Total_Loan_amount
from finance_1 join finance_2
on finance_1.id=finance_2.id
group by finance_1.term;