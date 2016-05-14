module DParse
  module Parsers
    class ProtoJSON < DParse::Parser
      def self.new
        extend DParse::DSL

        json_value = nil # Undefined for now

        whitespace =
          repeat(whitespace_char)

        # Strig

        json_string =
          seq(
            char('"').ignore,
            repeat(char_not('"')).capture,
            char('"').ignore,
          ).compact.first

        # Array

        json_elements =
          intersperse(
            lazy { json_value },
            seq(
              whitespace,
              char(','),
              whitespace,
            ).ignore,
          ).compact

        json_array =
          seq(
            char('[').ignore,
            whitespace.ignore,
            json_elements,
            whitespace.ignore,
            char(']').ignore,
          ).compact.first

        # Misc

        json_true =
          string('true').map { |_| true }

        json_false =
          string('false').map { |_| false }

        json_null =
          string('null').map { |_| nil }

        # Number

        json_digit =
          char_in('0'..'9')

        # TODO: add floating point support
        # FIXME: #to_i is not going to cut it
        json_number =
          seq(
            opt(char('-')),
            alt(
              char('0'),
              seq(
                char_in('1'..'9'),
                repeat(json_digit),
              ),
            ),
          ).capture.map { |d, _, _| d.to_i }

        # Object

        json_pair =
          seq(
            json_string,
            whitespace.ignore,
            char(':').ignore,
            whitespace.ignore,
            lazy { json_value },
          ).compact

        json_pairs =
          intersperse(
            json_pair,
            seq(
              whitespace,
              char(','),
              whitespace,
            ).ignore,
          ).compact.map { |d| Hash[d] }

        json_object =
          seq(
            char('{').ignore,
            whitespace.ignore,
            json_pairs,
            whitespace.ignore,
            char('}').ignore,
          ).compact.first

        # Value

        json_value =
          alt(
            json_string,
            json_number,
            json_object,
            json_array,
            json_true,
            json_false,
            json_null,
          )

        # All

        json_object
      end

      def initialize(*)
        raise ArgumentError, "#{self.class} is not supposed to be initialized"
      end
    end
  end
end