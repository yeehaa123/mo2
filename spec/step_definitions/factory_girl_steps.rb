FactoryGirl.factories.each do |factory|
  factory.compile
  factory.human_names.each do |human_name|
    step "the following #{human_name} exists:" do |table|
      table.hashes.each do |human_hash|
        attributes = convert_human_hash_to_attribute_hash(human_hash, factory.associations)
        @user = FactoryGirl.create(factory.name, attributes)
      end
    end

    step "the following #{human_name.pluralize} exist:" do |table|
      table.hashes.each do |human_hash|
        attributes = convert_human_hash_to_attribute_hash(human_hash, factory.associations)
        @users =FactoryGirl.create(factory.name, attributes)
      end
    end

    step "a(n) #{human_name} exists" do
      @user = FactoryGirl.create(factory.name)
      @user.confirm!
      @user.save!
    end

    step "there is another user" do
      @user2 = FactoryGirl.create(:user, name: "wrong", email: "wrong@example.org")
      @user2.confirm!
      @user2.save!
    end

    step "I am a user" do
      @user = FactoryGirl.create(factory.name)
    end

    step ":count #{human_name.pluralize} exist" do |count|
      FactoryGirl.create_list(factory.name, count.to_i)
    end

    if factory.build_class.respond_to?(:columns)
      factory.build_class.columns.each do |column|
        name = column.respond_to?(:name) ? column.name : column.to_s
        human_column_name = name.downcase.gsub('_', ' ')
        step "a(n) #{human_name} exists with a(n) #{human_column_name} of :value" do |value|
          @user = FactoryGirl.create(factory.name, name => value)
        end

        step ":count #{human_name.pluralize} exist with a(n) #{human_column_name} of :value" do |count, value|
          @users = FactoryGirl.create_list(factory.name, count.to_i, name => value)
        end
      end
    end
  end
end