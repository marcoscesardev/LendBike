module BillsHelper
  def label_name(attribute)
    I18n.t('activerecord.attributes.bill.' + attribute)
  end
end
