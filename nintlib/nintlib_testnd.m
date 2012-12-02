function nintlib_testnd ( dim_num, func )

%*****************************************************************************80
%
%% NINTLIB_TESTND tests the integrators on a particular function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 March 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, function FUNC ( DIM_NUM, X ), the name of the function
%    to be integrated.
%
  nintlib_test01 ( dim_num, func );
  nintlib_test02 ( dim_num, func );
  nintlib_test03 ( dim_num, func );
  nintlib_test04 ( dim_num, func );
%
%  TEST05 is only set up for DIM_NUM = 2.
%
  if ( dim_num == 2 )
    nintlib_test05 ( dim_num, func );
  end

  nintlib_test06 ( dim_num, func );

  return
end
