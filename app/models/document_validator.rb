class DocumentValidator
  include ActiveModel::Validations

  validate :check_against_schema

  attr_reader :document, :schema

  def initialize(document:, schema:)
    @schema = schema
    @document = document
  end

  def check_against_schema
    doc_errors = @schema.validate(@document)
    doc_errors.each do |err|
      errors.add(:document, err.to_s)
    end
  end

end
