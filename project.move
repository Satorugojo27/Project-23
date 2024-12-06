module MyModule::EmployeePayroll {

    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;

    /// Struct representing an employee's payroll record.
    struct Employee has store, key {
        name: vector<u8>,           // Employee name (as bytes)
        salary: u64,                // Base salary in tokens
        bonus: u64,                 // Bonus amount
        tax_deduction: u64,         // Tax deduction amount
        last_paid: u64,             // Last payroll payment time
    }

    /// Function to register a new employee.
    public fun register_employee(owner: &signer, name: vector<u8>, salary: u64, bonus: u64, tax_deduction: u64) {
        let employee = Employee {
            name,
            salary,
            bonus,
            tax_deduction,
            last_paid: 0,  // Initially, no payments have been made
        };
        move_to(owner, employee);
    }
}