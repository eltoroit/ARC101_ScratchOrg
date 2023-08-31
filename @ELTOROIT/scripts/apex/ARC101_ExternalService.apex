ExternalService.ARC101EmployeesExtService employeesService = new ExternalService.ARC101EmployeesExtService();
ExternalService.ARC101EmployeesExtService.GetAllEmployees_Response resp = employeesService.GetAllEmployees();
List<ExternalService.ARC101EmployeesExtService_Employee> employees = resp.Code200;
for (ExternalService.ARC101EmployeesExtService_Employee employee : employees) {
    System.debug('--- --- ---');
    System.debug(employee.firstName);    
    System.debug(employee);    
}
