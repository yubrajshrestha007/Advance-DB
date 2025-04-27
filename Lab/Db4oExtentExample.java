import com.db4o.*;
import com.db4o.query.*;
import java.util.List;

// Address (Aggregated inside Employee)
class Address {
    private String street;
    private String city;

    public Address(String street, String city) {
        this.street = street;
        this.city = city;
    }

    public String getStreet() { return street; }
    public String getCity() { return city; }

    @Override
    public String toString() {
        return "Address{Street='" + street + "', City='" + city + "'}";
    }
}

// Base class: Employee
class Employee {
    protected String name;
    protected int age;
    protected Address address;  // Aggregation

    public Employee(String name, int age, Address address) {
        this.name = name;
        this.age = age;
        this.address = address;
    }

    public String getName() { return name; }
    public int getAge() { return age; }
    public Address getAddress() { return address; }

    @Override
    public String toString() {
        return "Employee{Name='" + name + "', Age=" + age + ", " + address + "}";
    }
}

// Derived class: Manager (Inheritance from Employee)
class Manager extends Employee {
    private double bonus;

    public Manager(String name, int age, Address address, double bonus) {
        super(name, age, address);
        this.bonus = bonus;
    }

    public double getBonus() { return bonus; }

    @Override
    public String toString() {
        return "Manager{Name='" + name + "', Age=" + age + ", Bonus=" + bonus + ", " + address + "}";
    }
}

public class Db4oExtentExample {
    private static final String DB_FILE = "database.db4o";

    public static void main(String[] args) {
        ObjectContainer db = Db4oEmbedded.openFile(Db4oEmbedded.newConfiguration(), DB_FILE);

        try {
            // Create
            createData(db);

            // Retrieve Extent of Employees and Managers
            readExtentOfEmployees(db);
            readExtentOfManagers(db);

            // Query Employees in New York
            queryByCity(db, "New York");

            // Update Manager Address
            updateManagerAddress(db, "Alice", new Address("999 Park Ave", "San Francisco"));

            // Delete an Employee
            deleteEmployee(db, "Bob");

            // Read again to verify changes
            readExtentOfEmployees(db);
        } finally {
            db.close(); // Always close the database
        }
    }

    // CREATE (Store Employee and Manager with Aggregation & Inheritance)
    public static void createData(ObjectContainer db) {
        db.store(new Employee("Bob", 30, new Address("123 Main St", "New York")));
        db.store(new Manager("Alice", 40, new Address("456 Broadway", "Los Angeles"), 10000));
        System.out.println("Data Stored.");
    }

    // READ (Retrieve Extent of all Employees including Managers)
    public static void readExtentOfEmployees(ObjectContainer db) {
        ObjectSet<Employee> employees = db.ext(Employee.class); // Retrieve extent of Employee class
        System.out.println("\nExtent of Employees (Including Managers):");
        while (employees.hasNext()) {
            Employee e = employees.next();
            long id = db.getID(e); // Retrieve the object identifier
            System.out.println("Object ID: " + id + " - " + e);
        }
    }

    // READ (Retrieve Extent of Managers)
    public static void readExtentOfManagers(ObjectContainer db) {
        ObjectSet<Manager> managers = db.ext(Manager.class); // Retrieve extent of Manager class
        System.out.println("\nExtent of Managers:");
        while (managers.hasNext()) {
            Manager m = managers.next();
            long id = db.getID(m); // Retrieve the object identifier
            System.out.println("Object ID: " + id + " - " + m);
        }
    }

    // QUERY by City (Find Employees in a Specific City)
    public static void queryByCity(ObjectContainer db, String city) {
        List<Employee> employees = db.query(e -> e.getAddress().getCity().equals(city));
        System.out.println("\nEmployees in " + city + ":");
        for (Employee e : employees) {
            long id = db.getID(e); // Retrieve the object identifier
            System.out.println("Object ID: " + id + " - " + e);
        }
    }

    // UPDATE (Modify Address for a Manager)
    public static void updateManagerAddress(ObjectContainer db, String name, Address newAddress) {
        List<Manager> result = db.query(m -> m.getName().equals(name));
        if (!result.isEmpty()) {
            Manager mgr = result.get(0);
            db.delete(mgr);  // Delete old entry
            db.store(new Manager(mgr.getName(), mgr.getAge(), newAddress, mgr.getBonus())); // Store updated object
            System.out.println("\nUpdated Address for Manager: " + name);
        }
    }

    // DELETE (Remove an Employee)
    public static void deleteEmployee(ObjectContainer db, String name) {
        List<Employee> result = db.query(e -> e.getName().equals(name));
        if (!result.isEmpty()) {
            db.delete(result.get(0));
            System.out.println("\nDeleted: " + name);
        }
    }
}

// Example Output:
// ------------------
// Data Stored.

// Extent of Employees (Including Managers):
// Object ID: 1 - Employee{Name='Bob', Age=30, Address{Street='123 Main St', City='New York'}}
// Object ID: 2 - Manager{Name='Alice', Age=40, Bonus=10000.0, Address{Street='456 Broadway', City='Los Angeles'}}

// Extent of Managers:
// Object ID: 2 - Manager{Name='Alice', Age=40, Bonus=10000.0, Address{Street='456 Broadway', City='Los Angeles'}}

// Employees in New York:
// Object ID: 1 - Employee{Name='Bob', Age=30, Address{Street='123 Main St', City='New York'}}

// Updated Address for Manager: Alice

// Deleted: Bob

// Extent of Employees (Including Managers):
// Object ID: 2 - Manager{Name='Alice', Age=40, Bonus=10000.0, Address{Street='999 Park Ave', City='San Francisco'}}
