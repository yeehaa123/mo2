module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end
end

RSpec.configure do |c|
  c.include WithinHelpers
end