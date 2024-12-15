# employee_leave_balance - mỗi thằng id_employee có 1 record thôi nha
# employee_day_off - AE khỏi code
# emp_branch_history

from faker import Faker
import random
from copy import deepcopy

fake = Faker()



# CREATE TABLE EMPLOYEE_LEAVE_BALANCE (
#     TotalDays INT NOT NULL DEFAULT 12 CHECK (TotalDays >= 0),
#     RemainingDays INT NOT NULL DEFAULT 12 CHECK (RemainingDays >= 0),
#      INT,
#     CONSTRAINT PK_EmployeeLeaveBalance PRIMARY KEY (ID_Employee),
#     CONSTRAINT CHK_Remaining_Total_Days CHECK (RemainingDays <= TotalDays)
# );

def generate_leave_balance(employee_id_list):
    for i in employee_id_list:
        print(f"INSERT INTO EMPLOYEE_LEAVE_BALANCE (ID_Employee) VALUES ({i});")

def generate_emp_branch_history(num_rec, employee_id_list, branch_id_list):
    for i in range(1, num_rec + 1):
        id_employee = random.choice(employee_id_list)
        branch_id = random.choice(branch_id_list)
        start_date = fake.date_between(start_date='-2y', end_date='today')
        end_date = fake.date_between(start_date=start_date, end_date='today')
        print(f"INSERT INTO EMP_BRANCH_HISTORY (ID_Employee, ID_Branch, StartDate, EndDate) VALUES ({id_employee}, {branch_id}, '{start_date}', '{end_date}');")
        



employee_id_list = [i for i in range(1, 101)]
branch_id_list = [i for i in range(1, 15)]
generate_leave_balance(employee_id_list)
generate_emp_branch_history(1000, employee_id_list, branch_id_list)