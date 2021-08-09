require_relative 'referential/version'

module Referential
  def ref(method_name)
    redefine!(self, method_name, instance_method(method_name).arity)
  end

  def cref(method_name)
    redefine!(singleton_class, method_name, method(method_name).arity)
  end

  private

  def redefine!(context, method_name, arity)
    raise 'Cannot compose methods with splat, keyword or default arguments!' if arity < 0

    context.alias_method new_name(method_name), method_name
    context.undef_method method_name

    context.define_method(
      method_name,
      &reference_block(new_name(method_name), arity)
    )
  end

  def new_name(method_name)
    "fun_#{method_name}".to_sym
  end

  def reference_block(new_name, arity)
    proc do |*args|
      proc { |*args| method(new_name).call(*args) }
        .curry(arity)
        .call(*args)
    end
  end
end
