show databases;

create database eproject1;
use eproject1;

select * from Finance_1;
desc Finance_1;
# member_id , funded_amnt , funded_amnt_inv , int_rate , installment , emp_title , annual_inc , pymnt_plan , desc , title , zipcode , dti

select * from Finance_2;
desc Finance_2;

select year(str_to_date(Finance_1.issue_d,'%d-%m-%Y')) loan_year, sum(Finance_1.loan_amnt) 
from Finance_1 join Finance_2
on Finance_1.id=Finance_2.id
group by year(str_to_date(Finance_1.issue_d,'%d-%m-%Y'))
order by loan_year;

select finance_1.grade , finance_1.sub_grade , sum(finance_2.revol_bal) 
from finance_1 join finance_2
on finance_1.id=finance_2.id
group by finance_1.grade , finance_1.sub_grade 
order by finance_1.grade , finance_1.sub_grade ;

select finance_1.verification_status , sum(finance_2.total_pymnt) as total_payment
from finance_1 join finance_2
on finance_1.id=finance_2.id
where finance_1.verification_status != "source verified"
group by finance_1.verification_status;

select finance_1.addr_state , finance_2.last_credit_pull_d,finance_1.loan_status , count(*) as total_loans
from finance_1 join finance_2
on finance_1.id=finance_2.id
group by finance_1.addr_state , finance_2.last_credit_pull_d,finance_1.loan_status 
order by finance_1.addr_state ;
# correct - but which output format you want 

select finance_1.home_ownership , max(str_to_date(finance_2.last_pymnt_d,'%d-%m-%Y')) , sum(finance_1.loan_amnt)
from finance_1 join finance_2
on finance_1.id=finance_2.id
group by finance_1.home_ownership;
# correct - but which output format you want

select finance_1.purpose ,sum(finance_1.loan_amnt)
from finance_1 join finance_2
on finance_1.id=finance_2.id
group by finance_1.purpose;

select finance_1.emp_length ,sum(finance_1.loan_amnt)
from finance_1 join finance_2
on finance_1.id=finance_2.id
group by finance_1.emp_length;

select finance_1.home_ownership ,sum(finance_1.loan_amnt)
from finance_1 join finance_2
on finance_1.id=finance_2.id
group by finance_1.home_ownership;

select finance_1.verification_status ,sum(finance_2.total_acc)
from finance_1 join finance_2
on finance_1.id=finance_2.id
group by finance_1.verification_status;

select finance_1.term ,sum(finance_1.loan_amnt)
from finance_1 join finance_2
on finance_1.id=finance_2.id
group by finance_1.term;