RSpec.describe Referential do
  before do
    stub_const 'Foo', Class.new
    Foo.class_eval { extend Referential }
    Foo.ref(
      Foo.define_method(:bar) { 'baz' }
    )

    Foo.ref(
      Foo.define_method(:square) { |number| number**2 }
    )

    Foo.cref(
      Foo.class.define_method(:cube) { |number| number**3 }
    )
  end

  let(:foo) { Foo.new }
  let(:number_array) { [1, 2, 3] }
  let(:squared_array) { [1, 4, 9] }
  let(:cubed_array) { [1, 8, 27] }

  it 'has a version number' do
    expect(Referential::VERSION).not_to be nil
  end

  it 'works with methods with zero arguments' do
    expect(foo.bar).to eq('baz')
  end

  it 'converts method into a proc' do
    expect(number_array.map(&foo.square)).to eq(squared_array)
  end

  it 'works as a regular method if all arguments are given' do
    expect(number_array.map { |element| foo.square(element) }).to eq(squared_array)
  end

  it 'converts class methods into procs too' do
    expect(number_array.map(&Foo.cube)).to eq(cubed_array)
  end

  it 'works as a class method if all arguments are given' do
    expect(number_array.map { |element| Foo.cube(element) }).to eq(cubed_array)
  end
end
