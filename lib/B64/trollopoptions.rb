# Options with Trollop
module TrollopOptions
  def trollop_options
    @opts = Trollop.options do
      opt :write, 'write to file', type: :string
      opt :read, 'read file', type: :string
      opt :delete, 'delete file', type: :string
      opt :add, 'add to file', type: :string
    end
  end
end
