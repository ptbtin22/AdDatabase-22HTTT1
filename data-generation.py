from faker import Faker
import random
from copy import deepcopy

fake = Faker()

departments = ['Management', 'Kitchen', 'Cleaning', 'Security', 'Reception', 'Accounting', 'Service']

mem_levels = ['Bronze', 'Silver', 'Gold']

no_of_branches = 15
no_of_areas = 5
no_of_employees = 100
no_of_parkings = 15
no_of_branch_foods = 600

sushi_themes = [
     "Sushi World", "Sushi Corner", "Sushi Factory", "Sushi Palace", 
    "Sushi Garden", "Sushi Island", "Sushi Bay", "Sushi Bar", "Sushi Spot", "Sushi Hub", "Sushi Haven"
]

sushi_food_types = [
        "Rolls", "Sashimi", "Nigiri", "Hand Rolls", "Bento", "Appetizers", "Desserts", "Beverages", "Ramen", "Donburi"
]

sushi_food_items = {
    "Rolls": [
        "California Roll", "Spicy Tuna Roll", "Dragon Roll", "Rainbow Roll","Philadelphia Roll", "Tempura Roll", "Vegetarian Roll"
    ],
    "Sashimi": [
        "Salmon Sashimi", "Tuna Sashimi", "Yellowtail Sashimi", "Octopus Sashimi", "Snapper Sashimi", "Mackerel Sashimi"
    ],
    "Nigiri": [
        "Salmon Nigiri", "Tuna Nigiri", "Eel Nigiri", "Shrimp Nigiri", "Egg Nigiri", "Crab Nigiri"
    ],
    "Hand Rolls": [
        "Spicy Tuna Hand Roll", "California Hand Roll", "Salmon Avocado Hand Roll", "Vegetable Hand Roll", "Shrimp Tempura Hand Roll"
    ],
    "Bento": [
        "Chicken Teriyaki Bento", "Salmon Teriyaki Bento", "Beef Bulgogi Bento", "Vegetarian Bento"
    ],
    "Appetizers": [
        "Edamame", "Gyoza", "Seaweed Salad", "Takoyaki", "Agedashi Tofu", "Miso Soup", "Spring Rolls"
    ],
    "Desserts": [
        "Mochi Ice Cream", "Green Tea Cheesecake", "Dorayaki", "Matcha Panna Cotta", "Sesame Balls"
    ],
    "Beverages": [
        "Green Tea", "Sake", "Plum Wine", "Ramune Soda", "Matcha Latte", "Iced Oolong Tea"
    ],
    "Ramen": [
        "Shoyu Ramen", "Miso Ramen", "Tonkotsu Ramen", "Spicy Chicken Ramen", "Vegetable Ramen", "Seafood Ramen"
    ],
    "Donburi": [
        "Gyudon (Beef Bowl)", "Katsudon (Pork Cutlet Bowl)", "Oyakodon (Chicken and Egg Bowl)", "Unadon (Eel Bowl)", "Tekka Don (Tuna Bowl)", "Chirashi Don (Scattered Sushi Bowl)"
    ]
}

def generate_area_data(num_records):
    area_id_list = []
    for i in range(1, num_records + 1):
        id_area = i 
        area_id_list.append(id_area)
        area_name = fake.city()
        print(f"INSERT INTO AREA (ID_Area, AreaName) VALUES ('{id_area}', '{area_name}');")
    return area_id_list

def generate_department_data(department_names = departments):
    department_id_list = []
    for i, department_name in enumerate(department_names, start=1):
        id_department = i
        department_id_list.append(id_department)
        salary = fake.random_int(7000000, 20000000)
        salary = round(salary / 500000) * 500000
        print(f"INSERT INTO DEPARTMENT (ID_Department, DepartmentName, Salary) VALUES ({id_department}, '{department_name}', {salary});")
    return department_id_list

def generate_employee_data(num_records, department_id_list):
    employee_id_list = []
    manager_id_list = []
    reception_dept_id = 5
    management_dept_id = 1
    management_count = 0 
    for i in range(1, num_records + 1):
        id_employee = i
        employee_id_list.append(id_employee)
        name = fake.name()
        dob = fake.date_of_birth(minimum_age=18, maximum_age=65)
        phone = fake.numerify("##########")
        gender = fake.random_element(['M', 'F'])
        if management_count < 15:
            department_id = management_dept_id
            management_count += 1
        else:
            department_id = fake.random_element([d for d in department_id_list if d != management_dept_id])
        if department_id == management_dept_id:
            manager_id_list.append(id_employee)
        print(f"INSERT INTO EMPLOYEE (ID_Employee, EmployeeName, DoB, PhoneNumber, Gender, ID_Department) VALUES ({id_employee}, '{name}', '{dob}', '{phone}', '{gender}', {department_id});")
    
    return {
        "employee_id_list": employee_id_list,
        "manager_id_list": manager_id_list
    }

def generate_branch_data(num_records, area_id_list, manager_id_list, no_of_branches = no_of_branches):
    branch_id_list = []
    branch_area_list = {i: [] for i in range(1, no_of_branches + 1)}
    employee_list = deepcopy(manager_id_list)
    for i in range(1, num_records + 1):
        id_branch = i
        branch_id_list.append(id_branch)
        branch_name = f"{fake.word().capitalize()} {random.choice(sushi_themes)}"
        address = fake.street_address()
        phone = fake.numerify("##########")
        openingHour = fake.random_int(6, 12)
        closingHour = fake.random_int(18, 24)
        openingHour_time = f"{openingHour:02}:00:00"
        closingHour_time = f"{closingHour:02}:00:00"
        area_id = fake.random_element(area_id_list)
        branch_area_list[id_branch].append(area_id)
        manager_id = fake.random_element(employee_list)
        employee_list.remove(manager_id)
        print(f"INSERT INTO BRANCH (ID_Branch, BranchName, Address, PhoneNumber, OpeningHour, CloseHour, ID_Area, ID_Employee) "
              f"VALUES ({id_branch}, '{branch_name}', '{address}', '{phone}', '{openingHour_time}', '{closingHour_time}', {area_id}, {manager_id});")
    return {
        "branch_id_list": branch_id_list,
        "branch_area_list": branch_area_list
    }

def generate_parking_data(num_records, branch_id_list):
    parking_id_list = []
    for i in range(1, num_records + 1):
        id_parking = i
        parking_id_list.append(id_parking)
        address = fake.street_address()
        openingHour = fake.random_int(6, 12)
        closingHour = fake.random_int(18, 24)
        openingHour_time = f"{openingHour:02}:00:00"
        closingHour_time = f"{closingHour:02}:00:00"
        parkingType = fake.random_element([0, 1])
        branch_id = fake.random_element(branch_id_list)
        print(f"INSERT INTO PARKING (ID_Parking, Address, OpeningHour, CloseHour, ParkingType, ID_Branch) "
              f"VALUES ({id_parking}, '{address}', '{openingHour_time}', '{closingHour_time}', {parkingType}, {branch_id});")
    return parking_id_list

def generate_food_type_data(sushi_food_types):
    food_type_id_list = []
    for i, food_type in enumerate(sushi_food_types, start=1):
        id_food_type = i
        food_type_id_list.append({"id": id_food_type, "name": food_type})
        print(f"INSERT INTO FOOD_TYPE (ID_Type, TypeName) VALUES ({id_food_type}, '{food_type}');");
    return food_type_id_list

def generate_food_item_data(food_type_id_list, sushi_food_items):
    food_item_id_list = []
    food_item_id_restricted = []
    id_food_count = 1
    for food_type in food_type_id_list:
        food_type_id = food_type["id"]
        food_type_name = food_type["name"]
        food_items = sushi_food_items[food_type_name]
        for food_item in enumerate(food_items, start=1):
            id_food_item = id_food_count
            food_item_id_list.append(id_food_item)
            price = fake.random_int(80000, 1000000)
            price = round(price / 1000) * 1000
            isAreaRestricted = random.choices([0, 1], weights=[0.8, 0.2], k=1)[0]
            if isAreaRestricted:
                food_item_id_restricted.append(id_food_item)
            deliverySafe = random.choices([0, 1], weights=[0.2, 0.8], k=1)[0]
            print(f"INSERT INTO FOOD_ITEM (ID_Food, FoodName, Price, isAreaRestricted, DeliverySafe, ID_Type) VALUES ({id_food_item}, '{food_item}', {price}, {isAreaRestricted}, {deliverySafe}, {food_type_id});")
            id_food_count += 1
    return {
        "food_item_id_list": food_item_id_list,
        "food_item_id_restricted": food_item_id_restricted
    }

def generate_area_specific_food_data(food_item_id_restricted, area_id_list, num_records):
    food_list = deepcopy(food_item_id_restricted)
    generated_pairs = set()
    for i in range(1, num_records + 1):
        while True:
            id_area = fake.random_element(area_id_list)
            id_food = fake.random_element(food_item_id_restricted)
            if (id_area, id_food) not in generated_pairs:
                generated_pairs.add((id_area, id_food))
                break
        if id_food in food_list: 
            food_list.remove(id_food)
        print(f"INSERT INTO AREA_SPECIFIC_FOOD (ID_Area, ID_Food) VALUES ({id_area}, {id_food});")
    while len(food_list) > 0:
        id_food = food_list.pop()
        id_area = fake.random_element(area_id_list)
        generated_pairs.add((id_area, id_food))
        print(f"INSERT INTO AREA_SPECIFIC_FOOD (ID_Area, ID_Food) VALUES ({id_area}, {id_food});")
    return generated_pairs

def generate_branch_food_data(branch_id_list, food_item_id_list, food_item_id_restricted, branch_area_list, area_specific_food_pairs, num_records):
    generated_pairs = set()
    for i in range(1, num_records + 1):
        id_branchfood = i
        while True:
            id_branch = fake.random_element(branch_id_list)
            id_food = fake.random_element(food_item_id_list)
            if id_food in food_item_id_restricted:
                if (branch_area_list[id_branch][0], id_food) not in area_specific_food_pairs:
                    continue
            if (id_branch, id_food) not in generated_pairs:
                generated_pairs.add((id_branch, id_food))
                break 
        available = random.choices([0, 1], weights=[0.2, 0.8], k=1)[0]
        print(f"INSERT INTO BRANCH_FOOD (ID_BranchFood, Available, ID_Branch, ID_Food) VALUES ({id_branchfood}, {available}, {id_branch}, {id_food});")
    return generated_pairs

def generate_table_data(branch_id_list):
    branch_table_list = {}
    id_table_count = 1
    for branch_id in branch_id_list:
        branch_table_list[branch_id] = []
        num_records = fake.random_int(20, 30)
        for i in range(1, num_records + 1):
            id_table = id_table_count
            branch_table_list[branch_id].append(id_table)
            number_of_seats = fake.random_element([2, 4, 6, 8])
            status_table = random.choices([0, 1], weights=[0.5, 0.5], k=1)[0]
            print(f"INSERT INTO TABLE (ID_Table, NumberOfSeats, Status, ID_Branch) VALUES ({id_table}, {number_of_seats}, {status_table}, {branch_id});")
            id_table_count += 1
    return branch_table_list

def generate_mem_level_data(mem_levels):
    mem_level_id_list = []
    for i, mem_level in enumerate(mem_levels, start=1):
        id_mem_level = i
        mem_level_id_list.append(id_mem_level)
        discount = fake.random_int(5, 20)
        print(f"INSERT INTO MEMBERSHIP_LEVEL (ID_MemLevel, MemLevelName, Discount) VALUES ({id_mem_level}, '{mem_level}', {discount});")
    return mem_level_id_list

def generate_membership_data(num_records, mem_level_id_list, id_employee_list):
    list_card = []
    for i in range(1, num_records + 1):
        id_card = i
        list_card.append(id_card)
        status = 1
        date_created = fake.date_this_year()
        point = 0
        id_level = 1
        print(f"INSERT INTO MEMBERSHIP (ID_Card, Status, DateCreated, Point, ID_Level) VALUES ({id_card}, {status}, '{date_created}', {point}, {id_level});")
    return list_card

def generate_customer_data(list_card):
    customer_id_list = []
    for i in range(1, len(list_card) + 1):
        id_customer = i
        customer_id_list.append(id_customer)
        name = fake.name()
        phone = fake.numerify("##########")
        email = fake.email()
        gender = fake.random_element(['M', 'F'])
        ssid = fake.numerify("##########")
        id_card = i
        print(f"INSERT INTO CUSTOMER (ID_Customer, CustomerName, PhoneNumber, Email, Gender, SSID, ID_Card) VALUES ({id_customer}, '{name}', '{phone}', '{email}', '{gender}', '{ssid}', {id_card});")
    return customer_id_list

def generate_review_data(num_records):
    review_id_list = []
    for i in range(1, num_records + 1):
        id_review = i
        review_id_list.append(id_review)
        service_score = fake.random_int(1, 5)
        food_score = fake.random_int(1, 5)
        price_score = fake.random_int(1, 5)
        comment = fake.text(max_nb_chars=200)
        print(f"INSERT INTO REVIEW (ID_Review, ServiceScore, FoodScore, PriceScore, Comment) VALUES ({id_review}, {service_score}, {food_score}, {price_score}, '{comment}');")

if __name__ == "__main__":
    print('-- Generate data for Area table:')
    area_id_list =  generate_area_data(no_of_areas)
    print('-- Generate data for Department table:')
    department_id_list = generate_department_data()
    print('-- Generate data for Employee table:')
    result = generate_employee_data(no_of_branches, department_id_list)
    employee_id_list = result["employee_id_list"]
    manager_id_list = result["manager_id_list"]
    print('-- Generate data for Branch table:')
    result = generate_branch_data(no_of_branches, area_id_list, manager_id_list)
    branch_id_list = result["branch_id_list"]
    branch_area_list = result["branch_area_list"]
    print('-- Generate data for Parking table:')
    parking_id_list = generate_parking_data(no_of_parkings, branch_id_list)
    print('-- Generate data for Food Type table:')
    food_type_id_list = generate_food_type_data(sushi_food_types)
    print('-- Generate data for Food Item table:')
    result = generate_food_item_data(food_type_id_list, sushi_food_items)
    food_item_id_list = result["food_item_id_list"]
    food_item_id_restricted = result["food_item_id_restricted"]
    print('-- Generate data for Area Specific Food table:')
    area_specific_pairs = generate_area_specific_food_data(food_item_id_restricted, area_id_list, 5)
    print('-- Generate data for Branch Food table:')
    branch_food_pairs = generate_branch_food_data(branch_id_list, food_item_id_list, food_item_id_restricted, branch_area_list, area_specific_pairs, 10)
    print('-- Generate data for Table table:')
    branch_table_list = generate_table_data(branch_id_list)
    print('-- Generate data for Membership Level table:')
    mem_level_id_list = generate_mem_level_data(mem_levels)
    print('-- Generate data for Membership table:')
    card_list = generate_membership_data(no_of_branches, mem_level_id_list, employee_id_list)
    print('-- Generate data for Customer table:')
    customer_id_list = generate_customer_data(card_list)