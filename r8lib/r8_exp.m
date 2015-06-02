function value = r8_exp ( x )

%*****************************************************************************80
%
%% R8_EXP computes the exponential function, avoiding overflow and underflow.
%
%  Discussion:
%
%    For arguments of very large magnitude, the evaluation of the
%    exponential function can cause computational problems.  Some languages
%    and compilers may return an infinite value or a "Not-a-Number".  
%    An alternative, when dealing with a wide range of inputs, is simply
%    to truncate the calculation for arguments whose magnitude is too large.
%    Whether this is the right or convenient approach depends on the problem
%    you are dealing with, and whether or not you really need accurate
%    results for large magnitude inputs, or you just want your code to
%    stop crashing.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 September 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument of the exponential function.
%
%    Output, real VALUE, the value of exp ( X ).
%
  r8_big = 1.0E+30;
  r8_log_max = +69.0776;
  r8_log_min = -69.0776;

  if ( x <= r8_log_min )
    value = 0.0;
  elseif ( x < r8_log_max )
    value = exp ( x );
  else
    value = r8_big;
  end

  return
end
