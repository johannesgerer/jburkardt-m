# include "mex.h"

void mexFunction ( int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[] );
void cheby_u ( int n, double x, double cx[] );

//****************************************************************************80

void mexFunction ( int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[] )

//****************************************************************************80
//
//  Purpose:
//
//    MEXFUNCTION is a MATLAB/C++ interface for the Chebyshev U polynomial.
//
//  Discussion:
//
//    This file should be called "cheby_u.cpp".  It should be placed in the
//    MATLAB user's path.  It can either be compiled externally, with
//    a command like
//
//      mex cheby_u.cpp
//
//    creating a compiled MEX file, or, inside of MATLAB, the command
//
//      mex cheby_u.cpp
//
//    accomplishes the same task.  Once the file has been compiled,
//    the MATLAB user can invoke the function by typing:
//
//      cx = cheby_u ( n, x )
//
//    The routine computes the N+1 values of the Chebyshev U polynomials
//    of order 0 through N at the point X, returning the values in CX[1]
//    through CX[N+1].
//
//  Licensing:
//
//    This code is distributed under the GNU LGPL license.
//
//  Modified:
//
//    28 September 2013
//
//  Author:
//
//    Duane Hanselman and Bruce Littlefield
//
//  Reference:
//
//    Duane Hanselman, Bruce Littlefield,
//    Mastering MATLAB 7,
//    Pearson Prentice Hall, 2005,
//    ISBN: 0-13-143018-1.
//
//    The Mathworks,
//    MATLAB External Interfaces,
//    The Mathworks, 2000.
//
//  Parameters:
//
//    Input, int NLHS, the number of output arguments.
//
//    Input, mxArray *PLHS[NLHS], pointers to the output arguments.
//
//    Input, int NRHS, the number of input arguments.
//
//    Input, const mxArray *PRHS[NRHS], pointers to the input arguments.
//
{
  double *cx;
  int n;
  double x;
//
//  GET INPUT:
//    From the command line
//      cx = cheby_u ( n, x )
//    Retrieve the first scalar integer input argument N,
//    and the second (scalar?) real input argument X.
//
//    cx = cheby_u ( n, x )
//
  n = mxGetScalar ( prhs[0] );
  x = mxGetScalar ( prhs[1] );
//
//  MAKE ROOM FOR OUTPUT:
//    Make space for the output argument,
//    and copy the pointer to that space.
//
  plhs[0] = mxCreateDoubleMatrix ( n+1, 1, mxREAL );

  cx = mxGetPr ( plhs[0] );
//
//  COMPUTATION:
//    Now that we have the interface set up, we can call the C++ routine.
//
  cheby_u ( n, x, cx );

  return;
}
//****************************************************************************80

void cheby_u ( int n, double x, double cx[] )

//****************************************************************************80
//
//  Purpose:
//
//    CHEBY_U evaluates the Chebyshev polynomials of the second kind.
//
//  First terms:
//
//    U(0)(X) =   1
//    U(1)(X) =   2 X
//    U(2)(X) =   4 X^2 -   1
//    U(3)(X) =   8 X^3 -   4 X
//    U(4)(X) =  16 X^4 -  12 X^2 +  1
//    U(5)(X) =  32 X^5 -  32 X^3 +  6 X
//    U(6)(X) =  64 X^6 -  80 X^4 + 24 X^2 - 1
//    U(7)(X) = 128 X^7 - 192 X^5 + 80 X^3 - 8X
//
//  Licensing:
//
//    This code is distributed under the GNU LGPL license.
//
//  Modified:
//
//    18 July 2006
//
//  Author:
//
//    John Burkardt
//
//  Parameters:
//
//    Input, int N, the highest polynomial to compute.
//
//    Input, double X, the point at which the polynomials are to be computed.
//
//    Output, double CX[N+1], the values of the N+1 Chebyshev polynomials.
//
{
  int i;

  if ( n < 0 )
  {
    return;
  }

  cx[0] = 1.0;

  if ( n < 1 )
  {
    return;
  }

  cx[1] = 2.0 * x;

  for ( i = 2; i <= n; i++ )
  {
    cx[i] = 2.0 * x * cx[i-1] - cx[i-2];
  }

  return;
}
