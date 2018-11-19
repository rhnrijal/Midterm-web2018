# Initial Data for Role
@admin = Role.create(name: "Admin")
@cashier = Role.create(name: "Cashier")
@user = Role.create(name: "User")

# Admin
User.create(email: "admin@ait.asia",
            password: "secret123",
            password_confirmation: "secret123",
            role: @admin)
# Cashier
User.create(email: "cashier@ait.asia",
            password: "secret123",
            password_confirmation: "secret123",
            role: @cashier)

# User
User.create(email: "user@ait.asia",
            password: "secret123",
            password_confirmation: "secret123",
            role: @user)