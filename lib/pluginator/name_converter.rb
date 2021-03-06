=begin
Copyright 2013 Michal Papis <mpapis@gmail.com>

This file is part of pluginator.

pluginator is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published
by the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

pluginator is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with pluginator.  If not, see <http://www.gnu.org/licenses/>.
=end

module Pluginator
  # a helper for handling name / file / class conversions
  module NameConverter
  private

    # file_name, group => [ path, full_name, type ]
    def split_file_name(file_name, group)
      file_name.match(/.*\/(plugins\/(#{group}\/(.*)\/[^\/]*)\.rb)$/)[1..3]
    end

    # group => pattern
    def file_name_pattern(group, type=nil)
      "plugins/#{group}/#{type || "**"}/*.rb"
    end

    # full_name => class
    def name2class(name)
      klass = Kernel
      name.to_s.split(/\//).map{ |part|
        part.capitalize.gsub(/_(.)/){ $1.upcase }
      }.each{|part|
        klass = klass.const_get( part )
      }
      klass
    end

  end
end
