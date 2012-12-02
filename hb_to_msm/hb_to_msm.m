function a = hb_to_msm ( input_file )

%*****************************************************************************80
%
%% HB_TO_MSM reads a Harwell-Boeing Sparse Matrix File, and returns it in MATLAB Sparse format.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 March 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILE, the name of the file containing the 
%    Harwell-Boeing matrix data.
%
%    Output, real A, a sparse matrix in MATLAB sparse matrix format.
%
  input_unit = fopen ( input_file );

  if ( input_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HB_TO_MSM - Fatal error!\n' );
    fprintf ( 1, '  Error opening the file.\n' );
    error ( 'HB_TO_MSM - Fatal error!' );
  end

  [ title, key, totcrd, ptrcrd, indcrd, valcrd, rhscrd, mxtype, ...
    nrow, ncol, nnzero, neltvl, ptrfmt, indfmt, valfmt, rhsfmt, rhstyp, ...
    nrhs, nrhsix, colptr, rowind, values, rhsval, rhsptr, rhsind, guess, ...
    exact ] = hb_file_read ( input_unit );

  for col = 1 : ncol
    for k = colptr(col) : colptr(col+1)-1
      colind(k) = col;
    end
  end

  a = sparse ( rowind, colind, values, nrow, ncol );

  fclose ( input_unit );

  return
end

