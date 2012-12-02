function [ flam, flampl, flampu ] = p11_gul ( option, lambda )

%*****************************************************************************80
%
%% P11_GUL computes G(U,LAMBDA) and dG/dU and dG/dLAMBDA.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer OPTION, the option index.
%
%    Input, real LAMBDA, the value of LAMBDA.
%
%    Output, real FLAM, FLAMPL, FLAMPU, the values of F(U,LAMBDA),
%    d F(U,LAMBDA)/d LAMBDA, and d F(U,LAMBDA)/d U.
%
  if ( option == 1 )
    flam = - 5.0 * lambda;
    flampl = - 5.0;
    flampu = 0.0;
  elseif ( option == 2 )
    flam = - 10.0 * lambda;
    flampl = - 10.0;
    flampu = 0.0;
  end

  return
end
