Write a query to find all active customers. The query should return the SA ID and status.
Select sa_id , sa_Status_flg
from ci_sa 
where sa_status_flg = '20'

Write a query to get all service points with an "inactive" meter status. The query should return the service point ID and meter status.
Select sp.sp_id 
from ci_sp sp
 LEFT OUTER JOIN d1_sp_identifier spi
on (spi.sp_id_type_flg = 'D1EI' and sp.sp_id = spi.id_value)
 LEFT OUTER JOIN stgadm.d1_sp dsp
on spi.d1_sp_id = dsp.d1_sp_id
LEFT OUTER JOIN stgadm.d1_sp_k dsk
ON spi.d1_sp_id = dsk.d1_sp_id
LEFT OUTER JOIN stgadm.d1_sp_char dsc
ON spi.d1_sp_id = dsc.d1_sp_id 
LEFT OUTER JOIN stgadm.d1_sp_contact dsct
ON spi.d1_sp_id = dsct.d1_sp_id
LEFT OUTER JOIN stgadm.d1_install_evt ine
on spi.d1_sp_id = ine.d1_sp_id
LEFT OUTER JOIN stgadm.d1_dvc_cfg dcg
on ine.device_config_id = dcg.device_config_id
LEFT OUTER JOIN stgadm.d1_dvc ddc
on dcg.d1_device_id = ddc.d1_device_id

Write a query to list all customers who have an active service agreement. The query should return the customer ID and service agreement ID.
Select a.acct_id, sa.sa_id 
from ci_acct a
LEFT OUTER JOIN ci_sa SA
on a.acct_id = sa.acct_id 
where sa.sa_status_flg = '20'

Write a query to find premises associated with inactive accounts. The query should return the premise ID and account status.
select cp.prem_id, a.acct_id 
from ci_prem
LEFT OUTER JOIN ci_acct a 
ON cp.prem_id = a.mailing_prem_id
LEFT OUTER JOIN ci_sa sa 
ON a.acct_id = sa.acct_id 
where sa_status_flg != '20'


Write a query to retrieve all accounts that have unpaid bills. The query should return the account ID and bill ID.
Select a.acct_id , p.pay_id
from stgadm.ci_acct 
LEFT OUTER JOIN stgadm.ci_pay p
on a.acct_id = p.acct_id
where p.pay_status_flg in ('10','20','60')



Write a query to list customers who have a "wastewater" service point. The query should return the customer ID and service point ID.
select a.acct_id,sp.sp_id  from stgadm.ci_sp_char sp
left join stgadm.ci_sa_sp ss 
on sp.sp_id = ss.sp_id
left join stgadm.ci_sa sa
on ss.sa_id = sa.sa_id 
left join stgadm.ci_acct a
on sa.acct_id = a.acct_id
where sp.CHAR_TYPE_CD = 'CM-WWFLG';

Write a query to count all active service agreements. The query should return the total count.
select count(sa_id) from ci_sa where sa_status_flg = '20'

Write a query to find all accounts linked to a specific premise ID. The query should return the account ID and premise ID.
select cp.prem_id , a.acct_id
from ci_prem cp 
left outer join ci_acct a
on cp.prem_id = a.mailing_prem_id
where prem_id = '


Write a query to find all active accounts with unpaid bills. The query should return the account ID, bill ID, and the due date of each unpaid bill.

Write a query to retrieve all inactive service agreements linked to a premise. The query should return the service agreement ID, premise ID, and the service agreement end date.

Write a query to find all customers with multiple active service agreements. The query should return the customer ID, service agreement ID, and the start date of each active service agreement.

Write a query to list all service points associated with customers who have had late payments within the past year. The query should return the customer ID, service point ID, and the date of the last late payment.

Write a query to retrieve the total billed amount for each account over the past 6 months. The query should return the account ID, total billed amount, and the last bill date.

Write a query to identify all premises with both active electricity and water services. The query should return the premise ID, electricity service ID, and water service ID.

Write a query to find all active service agreements with a meter status of inactive. The query should return the service agreement ID, meter ID, and service start date.

Write a query to list all customers who have both active and inactive accounts. The query should return the customer ID, active account ID, and inactive account ID.
Select a.acct_id from ci_acct a
left outer join ci_sa sa
on a.acct_id = sa.acct_id 
where sa.sa_status_flg = '20' and sa.sa_Status_flg <> '20';
janan
