# frozen_string_literal: true

class Invoice < ApplicationRecord
  belongs_to :user

  has_one_attached :qr_code

  #after_create :generate_cfdi_digital_stamp

  # FAKE DIGITAL SIGNATURE
  def generate_cfdi_digital_stamp
    self.cfdi_digital_stamp = (0...500).map { ('a'..'z').to_a[rand(100)] }.join
    save
  end
end
