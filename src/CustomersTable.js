const customers = [
  { id: 1, name: 'Alice Johnson', email: 'alice@example.com', phone: '555-0101', status: 'Active', createdAt: '2024-01-15' },
  { id: 2, name: 'Bob Smith', email: 'bob@example.com', phone: '555-0102', status: 'Inactive', createdAt: '2024-02-20' },
  { id: 3, name: 'Carol White', email: 'carol@example.com', phone: '555-0103', status: 'Active', createdAt: '2024-03-05' },
  { id: 4, name: 'David Brown', email: 'david@example.com', phone: '555-0104', status: 'Active', createdAt: '2024-04-11' },
  { id: 5, name: 'Eva Martinez', email: 'eva@example.com', phone: '555-0105', status: 'Inactive', createdAt: '2024-05-22' },
];

function CustomersTable() {
  return (
    <table className="customers-table">
      <thead>
        <tr>
          <th>ID</th>
          <th>Name</th>
          <th>Email</th>
          <th>Phone</th>
          <th>Status</th>
          <th>Created At</th>
        </tr>
      </thead>
      <tbody>
        {customers.map((customer) => (
          <tr key={customer.id}>
            <td>{customer.id}</td>
            <td>{customer.name}</td>
            <td>{customer.email}</td>
            <td>{customer.phone}</td>
            <td>{customer.status}</td>
            <td>{customer.createdAt}</td>
          </tr>
        ))}
      </tbody>
    </table>
  );
}

export default CustomersTable;
