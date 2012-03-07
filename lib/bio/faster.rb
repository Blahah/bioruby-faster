
#
# Copyright(C) 2012 Francesco Strozzi <francesco.strozzi@gmail.com>
#

module Bio

  module Faster

    extend FFI::Library

    ffi_lib Bio::Faster::Library.load

    class Record < FFI::Struct
      layout :id, :pointer,
             :comment, :pointer,
             :seq, :pointer,
             :quality, :pointer,
             :filename, :pointer,
             :stream, :pointer
    end

    attach_function :fastQ_iterator, [Record], :int

    def self.parse_fastq(file)
        seq = Record.new
        seq[:filename] = FFI::MemoryPointer.from_string(file)
        while Bio::Faster.fastQ_iterator(seq) == 1
          puts "From Ruby:"
          puts seq[:id].read_string
          puts seq[:seq].read_string
          puts seq[:quality].read_string
        end
    end

  end
end