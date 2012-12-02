function value = p23_i4vec ( action, name, dim_num, value )

%*****************************************************************************80
%
%% P23_I4VEC sets or gets I4VEC parameters for problem 23.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 March 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string ACTION, the action.
%    'D' sets the object to a default value.
%    'G' means the current value of the object should be returned.
%    'S' means the input values of the object and its dimension should
%    be stored.
%
%    Input, string NAME, the name of the parameter.
%    'E' is the exponent vector.
%
%    Input, integer DIM_NUM, the dimension of the object.
%
%    Input/output, integer VALUE(DIM_NUM), the value of the object.
%
  persistent e
  persistent dim_num_save

  if ( size ( dim_num_save ) == 0 )
    dim_num_save = 0;
  end

  if ( dim_num_save ~= dim_num )
    dim_num_save = 0;
    e = [];
  end

  if ( dim_num_save == 0 )
    dim_num_save = dim_num;
  end

  if ( action == 'D' | action == 'd' )

    if ( name == 'E' | name == 'e' | name == '*' )
      e(1:dim_num) = 2;
    end

  elseif ( action == 'G' | action == 'g' )

    if ( name == 'E' | name == 'e' )
      value(1:dim_num) = e(1:dim_num);
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P23_I4VEC - Fatal error!\n' );
      fprintf ( 1, '  Unrecognized name = "%s".\n', name );
      error ( 'P23_I4VEC - Fatal error!' );
    end

  elseif ( action == 'S' | action == 's' )

    if ( name == 'E' | name == 'e' )
      e(1:dim_num) = value(1:dim_num);
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P23_I4VEC - Fatal error!\n' );
      fprintf ( 1, '  Unrecognized name = "%s".\n', name );
      error ( 'P23_I4VEC - Fatal error!' );
    end

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'P23_I4VEC - Fatal error!\n' );
    fprintf ( 1, '  Unrecognized action = "%s".\n', action );
    error ( 'P23_I4VEC - Fatal error!' );

  end

  return
end
