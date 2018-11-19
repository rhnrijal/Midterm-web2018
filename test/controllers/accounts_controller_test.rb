require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account = accounts(:one)
  end

  test "should get index" do
    get accounts_url
    assert_response :success
  end

  test "should get new" do
    get new_account_url
    assert_response :success
  end

  test "should create account" do
    assert_difference('Account.count') do
      post accounts_url, params: { account: {
          balance: @account.balance, number: 'ABC123' } }
    end
    assert_redirected_to account_url(Account.last)
  end

  test "should not create account" do
    assert_difference('Account.count') do
      post accounts_url, params: { account: { balance: '', number: '' } }
    end
    assert_redirected_to account_url(Account.last)
  end

  test "should show account" do
    get account_url(@account)
    assert_response :success
  end

  test "should get edit" do
    get edit_account_url(@account)
    assert_response :success
  end

  test "should update account" do
    patch account_url(@account), params: { account: {
        balance: @account.balance, number: 'ABC123' } }
    assert_redirected_to account_url(@account)
  end

  test "should not update account" do
    patch account_url(@account), params: { account: {
        balance: @account.balance, number: '' } }
    assert_redirected_to account_url(@account)
  end

  test "should validate on create account" do
    assert_difference('Account.count', 0) do
      post accounts_url, params: { account: {
          balance: @account.balance, number: @account.number } }
    end
    assert_response :success
    assert_select 'li', 'Number has already been taken'
  end

  test "should validate on update account" do
    patch account_url(@account), params: { account: {
        balance: @account.balance, number: @account.number } }
    assert_response :success
    assert_select 'li', 'Number has already been taken'
  end


  test "should destroy account" do
    assert_difference('Account.count', -1) do
      delete account_url(@account)
    end

    assert_redirected_to accounts_url
  end

  test "should not destroy account" do
    assert_difference('Account.count', 0) do
      delete account_url(@account)
    end

    assert_redirected_to accounts_url
  end
end
