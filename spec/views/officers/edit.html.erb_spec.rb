# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('officers/edit', type: :view) do
  before do
    @officer = assign(:officer, Officer.create!(
                                  position: 'MyString'
                                )
    )
  end

  it 'renders the edit officer form' do
    render

    assert_select 'form[action=?][method=?]', officer_path(@officer), 'post' do
      assert_select 'input[name=?]', 'officer[position]'
    end
  end
end
