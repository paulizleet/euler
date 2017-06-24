require_relative 'euler_utils'

def run

  triangle_index = 2
  triangle = 1

  while get_divisors(triangle).length < 500

    triangle = triangle_index + triangle
    triangle_index += 1

  end
  triangle
end




p run
