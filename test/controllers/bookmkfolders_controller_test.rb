require 'test_helper'

class BookmkfoldersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bookmkfolder = bookmkfolders(:one)
  end

  test "should get index" do
    get bookmkfolders_url
    assert_response :success
  end

  test "should get new" do
    get new_bookmkfolder_url
    assert_response :success
  end

  test "should create bookmkfolder" do
    assert_difference('Bookmkfolder.count') do
      post bookmkfolders_url, params: { bookmkfolder: { bookmkfoldercolor: @bookmkfolder.bookmkfoldercolor, bookmkfoldertitle: @bookmkfolder.bookmkfoldertitle } }
    end

    assert_redirected_to bookmkfolder_url(Bookmkfolder.last)
  end

  test "should show bookmkfolder" do
    get bookmkfolder_url(@bookmkfolder)
    assert_response :success
  end

  test "should get edit" do
    get edit_bookmkfolder_url(@bookmkfolder)
    assert_response :success
  end

  test "should update bookmkfolder" do
    patch bookmkfolder_url(@bookmkfolder), params: { bookmkfolder: { bookmkfoldercolor: @bookmkfolder.bookmkfoldercolor, bookmkfoldertitle: @bookmkfolder.bookmkfoldertitle } }
    assert_redirected_to bookmkfolder_url(@bookmkfolder)
  end

  test "should destroy bookmkfolder" do
    assert_difference('Bookmkfolder.count', -1) do
      delete bookmkfolder_url(@bookmkfolder)
    end

    assert_redirected_to bookmkfolders_url
  end
end
