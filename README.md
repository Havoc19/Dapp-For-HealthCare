# Dapp-For-HealthCare

This is Smart Contract for HealthCare.
I have used oneclickdapp.com to make it a complete dapp and Ganache as a local BlockChain and Metamask to connect dapp to blockchain.

This is Patient's Browser
![PatientBrowser](https://user-images.githubusercontent.com/57176420/116933030-a0e3b100-ac80-11eb-8674-e78dfb681cd4.png)
Here Patient has deployed the smart contract from remix ide and used 'injected web' as environment to connect to metmask

This is Doctor's Browser
![DoctorBrowser](https://user-images.githubusercontent.com/57176420/116932943-8a3d5a00-ac80-11eb-83c0-87298bec9eb6.png)

# Description
This is my Dapp.
Here the patient has control over it's own data. He can give permission to Doctor to create details and permission to chemist to view this details,without his permission the
doctor will not be able to edit and chemist will not be able to view.
Smart Contract also keep's track of doctor's visited and chemist visited, and also by doctor's address we can get information created by doctor individually.
Patient can also revoke their permission.

# How-To-Use-Code
Copy and Paste code on remix-ide.
Change environment to injected web,make sure your metamask is connected to ganache.
![remix-setting](https://user-images.githubusercontent.com/57176420/116933854-c1603b00-ac81-11eb-99d9-6b8c9f76b9f7.png)

Then from plugin manager enable oneclickdapp.
Deploy your project copy your contract address and paste on address bar,then click generate dapp.
Your dapp is ready,then click the link.
