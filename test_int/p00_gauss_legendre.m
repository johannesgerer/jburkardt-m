function result = p00_gauss_legendre ( prob, int_num )

%*****************************************************************************80
%
%% P00_GAUSS_LEGENDRE applies a composite Gauss-Legendre rule.
%
%  Discussion:
%
%    A 4 point rule is used.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 November 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROB, the problem index.
%
%    Input, integer INT_NUM, the number of subintervals.
%
%    Output, real RESULT, the approximate integral.
%
  gauss_num = 4;
  gauss_abs = [ ...
    -0.861136311594052575223946488893, ...
    -0.339981043584856264802665759103, ...
     0.339981043584856264802665759103, ...
     0.861136311594052575223946488893 ];
  gauss_weight = [ ...
    0.347854845137453857373063949222, ...
    0.652145154862546142626936050778, ...
    0.652145154862546142626936050778, ...
     0.347854845137453857373063949222 ];

  [ a, b ] = p00_lim ( prob );

  h = ( b - a ) / ( int_num );

  ab(1:int_num+1) =  ( ( int_num - (0:int_num) ) * a   ...
                     + (           (0:int_num) ) * b ) ...
                     / ( int_num               );

  result = 0.0;

  for i = 1 : gauss_num

    x(1:int_num) = 0.5 * ( ( 1.0 - gauss_abs(i) ) * ab(1:int_num) ...
                         + ( 1.0 + gauss_abs(i) ) * ab(2:int_num+1) );

    result = result + 0.5 * gauss_weight(i) * h ...
      * sum ( p00_fun ( prob, int_num, x(1:int_num) ) );

  end

  return
end
