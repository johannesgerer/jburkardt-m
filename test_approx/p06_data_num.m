function data_num = p06_data_num ( )

%*****************************************************************************80
%
%% P06_DATA_NUM returns the dimension of the data vector for problem 6.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 August 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, integer DATA_NUM, the dimension of the data vector.
%
  num_int = 5;

  data_num = 1 + num_int * ( num_int + 1 );

  return
end
