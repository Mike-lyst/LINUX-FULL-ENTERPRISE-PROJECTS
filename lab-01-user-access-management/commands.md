# Lab 01 — Commands Used

## Group Creation
sudo groupadd it
sudo groupadd engineering
sudo groupadd finance
sudo groupadd operations

---

## User Creation

### IT Department
for i in {1..5}; do sudo useradd -m ituser$i; done

### Engineering Department
for i in {1..10}; do sudo useradd -m enguser$i; done

### Finance Department
for i in {1..5}; do sudo useradd -m finuser$i; done

### Operations Department
for i in {1..5}; do sudo useradd -m opsuser$i; done

---

## Group Assignment
for i in {1..5}; do sudo usermod -aG it ituser$i; done
for i in {1..10}; do sudo usermod -aG engineering enguser$i; done
for i in {1..5}; do sudo usermod -aG finance finuser$i; done
for i in {1..5}; do sudo usermod -aG operations opsuser$i; done

---

## Department Directories
sudo mkdir /srv/it /srv/engineering /srv/finance /srv/operations

---

## Ownership & Permissions
sudo chown :it /srv/it
sudo chown :engineering /srv/engineering
sudo chown :finance /srv/finance
sudo chown :operations /srv/operations

sudo chmod 770 /srv/it
sudo chmod 770 /srv/engineering
sudo chmod 770 /srv/finance
sudo chmod 770 /srv/operations

---

## Sudo Access (IT Admin Only)
sudo usermod -aG sudo ituser1

---

## Verification
groups ituser1
groups enguser1

su - enguser1
cd /srv/finance   # Expected: Permission denied
cd /srv/engineering  # Expected: Access allowed