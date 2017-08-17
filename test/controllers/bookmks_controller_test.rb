require 'test_helper'

class BookmksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bookmk = bookmks(:one)
  end

  test "should get index" do
    get bookmks_url
    assert_response :success
  end

  test "should get new" do
    get new_bookmk_url
    assert_response :success
  end

  test "should create bookmk" do
    assert_difference('Bookmk.count') do
      post bookmks_url, params: { bookmk: { bookmkclick: @bookmk.bookmkclick, bookmkfolder_id: @bookmk.bookmkfolder_id, bookmkobj: @bookmk.bookmkobj, bookmkseq: @bookmk.bookmkseq, user_id: @bookmk.user_id } }
    end

    assert_redirected_to bookmk_url(Bookmk.last)
  end

  test "should show bookmk" do
    get bookmk_url(@bookmk)
    assert_response :success
  end

  test "should get edit" do
    get edit_bookmk_url(@bookmk)
    assert_response :success
  end

  test "should update bookmk" do
    patch bookmk_url(@bookmk), params: { bookmk: { bookmkclick: @bookmk.bookmkclick, bookmkfolder_id: @bookmk.bookmkfolder_id, bookmkobj: @bookmk.bookmkobj, bookmkseq: @bookmk.bookmkseq, user_id: @bookmk.user_id } }
    assert_redirected_to bookmk_url(@bookmk)
  end

  test "should destroy bookmk" do
    assert_difference('Bookmk.count', -1) do
      delete bookmk_url(@bookmk)
    end

    assert_redirected_to bookmks_url
  end
end
