class Product < ApplicationRecord
  validates :name, length: { minimum: 5, maximum: 50 }
  validates :price, numericality: { greater_than: 0 }
  validates :barcode, presence: false
  validate :barcode_check_digit

  private

  def barcode_check_digit
    return if barcode.blank?

    array = barcode.split('').map(&:to_i)
    dv = array.pop

    sum = array.map.with_index { |n, i| (i % 2).zero? ? n : n * 3 }.sum

    return if (((sum / 10) + 1) * 10) - sum == dv

    errors.add(:barcode, 'Código de barras inválido')
  end
end
