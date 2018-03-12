class Document < ApplicationRecord
  has_attached_file :doc
  validates_attachment :doc, presence: true,
    content_type: {content_type: [
      # Microsoft Word
      'application/msword',
      'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
      'application/msword',
      'application/vnd.openxmlformats-officedocument.wordprocessingml.template',
      'application/vnd.ms-word.document.macroEnabled.12',
      'application/vnd.ms-word.template.macroEnabled.12',
      'application/vnd.ms-word.document.macroEnabled.12',
      'application/vnd.ms-word.template.macroEnabled.12',
      'application/msword',
      'application/msword',

      # Microsoft Excel
      'application/msexcel',
      'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
      'application/msexcel',
      'application/vnd.openxmlformats-officedocument.spreadsheetml.template',
      'application/msexcel',
      'application/msexcel',
      'application/vnd.ms-excel.sheet.macroEnabled.12',
      'application/vnd.ms-excel.sheet.binary.macroEnabled.12',
      'application/vnd.ms-excel.template.macroEnabled.12',
      'application/vnd.ms-excel.addin.macroEnabled.12',

      # Microsoft PowerPoint
      'application/mspowerpoint',
      'application/vnd.openxmlformats-officedocument.presentationml.presentation',
      'application/mspowerpoint',
      'application/vnd.openxmlformats-officedocument.presentationml.template',
      'application/mspowerpoint',
      'application/vnd.openxmlformats-officedocument.presentationml.slideshow',
      'application/mspowerpoint',
      'application/vnd.ms-powerpoint.addin.macroEnabled.12',
      'application/vnd.ms-powerpoint.presentation.macroEnabled.12',
      'application/vnd.ms-powerpoint.slideshow.macroEnabled.12',
      'application/vnd.ms-powerpoint.template.macroEnabled.12',

      # Microsoft Access
      'application/msaccess',
      'application/msaccess',
      'application/msaccess',
      'application/msaccess',
      'application/msaccess',
      'application/msaccess',
      'application/msaccess',
      'application/msaccess',
      'application/msaccess',
      'application/msaccess',
      'application/msaccess',
      'application/msaccess',
      'application/msaccess',
      'application/msaccess',

      # PDF
      'application/pdf',
      'application/x-pdf',

      # архивы
      "application/zip",

      # Other
      'application/vnd.ms-office.calx',
      'application/x-winhelp',
      'application/msproject',
      'application/vnd.ms-officetheme',
      'application/mswrite'
      ]},
     size: { in: 0..30.megabytes }
   do_not_validate_attachment_file_type :doc

  belongs_to :task, optional: true
  belongs_to :direction, optional: true

  # after_validation :at_least_one_link_must_exist
  before_save :at_least_one_link_must_exist

  def at_least_one_link_must_exist
    if task.nil? && direction.nil?
      self.errors.add(:task, 'ERROR at_least_one_link_must_exist callback')
      self.errors.add(:direction, 'ERROR at_least_one_link_must_exist callback')
      return false
    end
  end

end
