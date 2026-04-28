# Salesforce Async Contact Integration System

## 🚀 Overview

This project demonstrates an asynchronous integration system in Salesforce that processes Contact records and sends them to an external ERP system using REST API callouts.

The system is built using Batch Apex and Queueable Apex to handle large data volumes efficiently.

---

## 🧠 Architecture Flow

Salesforce Contacts
→ Batch Apex Processing
→ External ERP API Callout
→ Response Handling (Success/Failure)
→ Queueable Job for Summary Logging

---

## ⚙️ Features

* Batch processing for large data sets
* External REST API integration
* Asynchronous processing using Queueable Apex
* Error handling with try/catch
* Success and failure tracking

---

## 🛠 Tech Stack

* Apex (Salesforce)
* Batch Apex
* Queueable Apex
* REST API Callouts
* Salesforce DX

---

## ▶️ How to Run

Execute the batch from Anonymous Apex:

```apex id="run1"
Database.executeBatch(new ContactBatch(), 200);
```

---

## 📌 Notes

This is a learning project focused on mastering Salesforce asynchronous processing and integration patterns.
