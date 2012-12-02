function value = p32_r8vec ( action, name, dim_num, value )

%*****************************************************************************80
%
%% P32_R8VEC sets or gets R8VEC parameters for problem 32.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 June 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string ACTION, the action.
%    'D' sets the internal value of the object to a default value.
%    If NAME = '*', then all variables are defaulted.
%    'G' means the current value of the object should be returned.
%    'R' means randomize the object and return it.
%    'S' means the input values of the object and its dimension should
%    be stored.
%
%    Input, string NAME, the name of the parameter.
%    'C' is the first vector.
%    'Z' is the base vector.
%
%    Input, integer DIM_NUM, the dimension of the object.
%
%    Input/output, real VALUE(DIM_NUM), the value of the object.
%
  persistent c
  persistent dim_num_save;
  persistent z

  if ( size ( dim_num_save ) == 0 )
    dim_num_save = 0;
  end

  if ( dim_num_save ~= dim_num )
    dim_num_save = 0;
    c = [];
    z = [];
  end

  if ( dim_num_save == 0 )
    dim_num_save = dim_num;
  end

  if ( action == 'D' | action == 'd' )

    if ( name == 'C' | name == 'c' | name == '*' )
      c(1:dim_num) = 0.5^( 1.0 / dim_num );
    end

    if ( name == 'Z' | name == 'z' | name == '*' )
      z(1:dim_num) = 0.5^( 1.0 / dim_num );
    end

  elseif ( action == 'G' | action == 'g' )

    if ( name == 'C' | name == 'c' )
      value(1:dim_num) = c(1:dim_num);
    elseif ( name == 'Z' | name == 'z' )
      value(1:dim_num) = z(1:dim_num);
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P32_R8VEC - Fatal error!\n' );
      fprintf ( 1, '  Unrecognized name = "%s".\n', name );
      error ( 'P32_R8VEC - Fatal error!' );
    end

  elseif ( action == 'R' | action == 'r' )

    if ( name == 'C' | name == 'c' )
      c = rand ( 1, dim_num );
      value(1:dim_num) = c(1:dim_num);
    elseif ( name == 'Z' | name == 'z' )
      z = rand ( 1, dim_num );
      value(1:dim_num) = z(1:dim_num);
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P32_R8VEC - Fatal error!\n' );
      fprintf ( 1, '  Unrecognized name = "%s".\n', name );
      error ( 'P32_R8VEC - Fatal error!' );
    end

  elseif ( action == 'S' | action == 's' )

    if ( name == 'C' | name == 'c' )
      c(1:dim_num) = value(1:dim_num);
    elseif ( name == 'Z' | name == 'z' )
      z(1:dim_num) = value(1:dim_num);
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P32_R8VEC - Fatal error!\n' );
      fprintf ( 1, '  Unrecognized name = "%s".\n', name );
      error ( 'P32_R8VEC - Fatal error!' );
    end

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'P32_R8VEC - Fatal error!\n' );
    fprintf ( 1, '  Unrecognized action = "%s".\n', action );
    error ( 'P32_R8VEC - Fatal error!' );

  end

  return
end
