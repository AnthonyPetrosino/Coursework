# Homework 4
Anthony Petrosino

## Question 1:
1a: If a password is three characters long and can only consist of uppercase letters from the alphabet, there are 17,576 (26^3) possible passwords to choose from. Therefore, if it takes five seconds to test each password, then this will take at worst 17,576 * 5 = 87,880 seconds (24.41 hours) and on average around half of that (12.2 hours). Meanwhile, if each test only requires 0.001 seconds, then we can find the password in at worst 17,576 * 0.001 = 17 seconds and on average around 8 seconds.

1b: It is tough to say how long a brute force attack would need to be to prohibit an attacker. I would argue that the brute force attack should be around six months long at it's worst case. On average, this would result in a success every three months, which in my opinion is too long to dedicate compute resources towards and is enough time for security systems to detect suspicious activity. 

## Question 2:
2: When a company sends your old password over email for account recovery, it suggests that that passwords are stored in plaintext or reversible encryption since they are easily accessed. If the company's database is ever breached, all user passwords could be quickly compromised since they might be easily read by attackers. Additionally, this approach suggests a bad security system architecture, as it indicates that multiple parts of the system have unnecessary access to user passwords. The ability to retrieve and send original passwords easily also puts users at risk if they reuse passwords across multiple platforms.

Meanwhile, a company sending a new temporary password reduces the website owner's vulnerability. This approach suggests that passwords are properly hashed, meaning the original passwords cannot be retrieved even if the database is compromised. It also mitigates the risk of an attacker gaining access through a compromised email as you can implement time limited tokens and secure password reset links. Sending new passwords better indicates the company follows security best practices for password storage, while sending old passwords reveals a critical flaw with the system that puts all user data at risk.

## Question 3:

I have created a basic Blazor website with user authentication. The website prompts users to enter a username and password to access protected content. I used Amazon Q to help me learn how to use Blazor and occasionally to help me with logic. 

Setup Instructions:
0. Navigate to the BlazorAuth directory: `cd BlazorAuth`
1. Run the application: `dotnet run`
2. Open your browser and go to the URL shown in the terminal (typically http://localhost:5000 or https://localhost:5001)
3. Use the following credentials to test the authentication:
   - Username: admin, Password: 325pwd

The website features a login page that validates user credentials and redirects to protected content upon successful authentication. It uses cookies to allow users to stay logged in within the same session.
