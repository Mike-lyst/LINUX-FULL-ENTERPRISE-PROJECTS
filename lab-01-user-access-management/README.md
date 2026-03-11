# Lab 01 — User & Access Management (Enterprise Linux)

## Overview
This lab simulates a real-world enterprise Linux environment by implementing
user and group management for a company with multiple departments.

The focus is on **role-based access control (RBAC)**, secure permissions,
and proper administrative boundaries.

---

## Scenario
An organization has four departments:
- IT
- Engineering
- Finance
- Operations

Each department requires:
- Separate users
- Controlled access to shared resources
- Restricted permissions
- Minimal administrative privileges

---

## Objectives
- Create Linux users for each department
- Organize users using groups
- Apply group-based permissions to directories
- Restrict access to sensitive resources
- Grant sudo privileges only to IT administrators

---

## Environment
- OS: Ubuntu Linux (WSL / VM / Server)
- Shell: Bash
- Role: Linux System Administrator

---

## Implementation Summary

### 1. Group Creation
Department-level groups were created to enforce role-based access control:
-IT
- engineering
- finance
- operations

### 2. User Creation
A total of **25 users** were created:
- IT: 5 users
- Engineering: 10 users
- Finance: 5 users
- Operations: 5 users

Each user was created with a home directory.

### 3. Group Assignment
Users were assigned to their respective department groups using group-based
access rather than individual permissions.

### 4. Shared Department Directories
Secure shared directories were created under `/srv` for each department.

Ownership and permissions were applied so that:
- Only users in the correct group can access their department directory
- Other users are denied access

### 5. Sudo Access Control
Only designated IT users were granted sudo privileges.
This follows the principle of **least privilege**.

---

## Security Principles Applied
- Role-Based Access Control (RBAC)
- Least Privilege
- Separation of Duties
- Group-based permission management

---

## Verification & Testing
- Group membership verified using `groups`
- Access tested using `su` and directory navigation
- Permission-denied errors confirmed for unauthorized access

---

## Outcome
This lab demonstrates the ability to:
- Manage users and groups at scale
- Apply enterprise Linux permission models
- Enforce secure access boundaries
- Document administrative changes clearly

---
