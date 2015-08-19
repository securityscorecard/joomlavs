# This file is part of Joomla VS.

# Joomla VS is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# Joomla VS is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with Joomla VS.  If not, see <http://www.gnu.org/licenses/>.

require 'colorize'
require 'readline'

# This class provides functionality to output
# to the screen in a consistent style.
class Output
  def initialize(use_colours = true)
    @use_colours = use_colours
  end

  def use_colours
    @use_colours
  end

  def print_line(prefix, text, new_line = true)
    print prefix

    if use_colours
      print " #{text}".light_white
    else
      print " #{text}"
    end

    print "\r\n" if new_line
  end

  def print_banner
    banner = %(
----------------------------------------------------------------------

     ██╗ ██████╗  ██████╗ ███╗   ███╗██╗      █████╗ ██╗   ██╗███████╗
     ██║██╔═══██╗██╔═══██╗████╗ ████║██║     ██╔══██╗██║   ██║██╔════╝
     ██║██║   ██║██║   ██║██╔████╔██║██║     ███████║██║   ██║███████╗
██   ██║██║   ██║██║   ██║██║╚██╔╝██║██║     ██╔══██║╚██╗ ██╔╝╚════██║
╚█████╔╝╚██████╔╝╚██████╔╝██║ ╚═╝ ██║███████╗██║  ██║ ╚████╔╝ ███████║
 ╚════╝  ╚═════╝  ╚═════╝ ╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚══════╝

----------------------------------------------------------------------

)
    print banner.light_white if use_colours
    print banner unless use_colours
  end

  def read_input(prompt)
    if use_colours
      print_line('[?]'.light_white, prompt, false)
    else
      print_line('[?]', prompt, false)
    end

    Readline.readline
  end

  def print_good(text)
    if use_colours
      print_line('[+]'.green, text)
    else
      print_line('[+]', text)
    end
  end

  def print_warning(text)
    if use_colours
      print_line('[!]'.yellow, text)
    else
      print_line('[!]', text)
    end
  end

  def print_info(text)
    if use_colours
      print_line('[i]'.cyan, text)
    else
      print_line('[i]', text)
    end
  end

  def print_error(text)
    if use_colours
      print_line('[!]'.red, text)
    else
      print_line('[!]', text)
    end
  end

  def print_indent(text)
    if use_colours
      print_line(' | '.light_white, text)
    else
      print_line(' | ', text)
    end
  end

  def print_line_break
    puts ''
  end

  def print_horizontal_rule
    puts '------------------------------------------------------------------'
  end
end