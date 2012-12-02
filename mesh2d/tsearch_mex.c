// mytsearch - replacement for MATLAB's tsearch
//
// This function is about as fast as MATLAB's tsearch, but does 
// not have the restriction that the triangulation be a Delaunay 
// triangulation.
//
// Type "mex mytsearch" in Matlab to compile.
// by David R. Martin, Boston College

#include "mex.h"

void
mexFunction(
    int nlhs, mxArray* plhs[],
    int nrhs, const mxArray* prhs[])
{
    // loop variables
    int i,j;

    // check the argument counts
    if (nrhs != 5) mexErrMsgTxt("Wrong number of input arguments.");
    if (nlhs != 1) mexErrMsgTxt("Wrong number of output arguments.");
    
    // get input arguments
    double* x = mxGetPr(prhs[0]);
    double* y = mxGetPr(prhs[1]);
    double* tri = mxGetPr(prhs[2]);
    double* X = mxGetPr(prhs[3]);
    double* Y = mxGetPr(prhs[4]);
    
    // check sizes of x,y,tri
    int nPts = mxGetNumberOfElements(prhs[0]);
    if (mxGetNumberOfElements(prhs[1]) != nPts) {
        mexErrMsgTxt("Size mismatch between x and y.");
    }
    if (mxGetNumberOfDimensions(prhs[2]) != 2) {
        mexErrMsgTxt("Argument 'tri' must be 2D.");
    }
    const int* triDim = mxGetDimensions(prhs[2]);
    if (triDim[1] != 3) {
        mexErrMsgTxt("Argument 'tri' must have 3 columns.");
    }
    int nTri = triDim[0];
    
    // check triangle vertex indices
    for (i=0; i<nTri*3; i++) {
        if (tri[i] < 1 || tri[i] > nPts) {
            mexErrMsgTxt("Triangle vertex out of range.");
        }
    }
    
    // check sizes of X,Y
    int nDimOut = mxGetNumberOfDimensions(prhs[3]);
    if (nDimOut != mxGetNumberOfDimensions(prhs[4])) {
        mexErrMsgTxt("Size mismatch between X and Y.");
    }
    const int* dimX = mxGetDimensions(prhs[3]);
    const int* dimY = mxGetDimensions(prhs[4]);
    for (i=0; i<nDimOut; i++) {
        if (dimX[i] != dimY[i]) {
            mexErrMsgTxt("Size mismatch between X and Y.");
        }
    }
    
    // allocate output argument
    plhs[0] = mxCreateNumericArray(nDimOut,dimX,mxDOUBLE_CLASS,mxREAL);
    double* t = mxGetPr(plhs[0]);
    int nOut = mxGetNumberOfElements(plhs[0]);
    const double NaN = mxGetNaN();
    for (i=0; i<nOut; i++) {
        t[i] = NaN;
    }
    
    // do the computation
    for (j=0; j<nTri; j++) {
        const int a = tri[0*nTri+j]-1;
        const int b = tri[1*nTri+j]-1;
        const int c = tri[2*nTri+j]-1;
        const double d1 = (x[b]-x[a])*(y[c]-y[a]) - (y[b]-y[a])*(x[c]-x[a]);
        const double d2 = (x[c]-x[b])*(y[a]-y[b]) - (y[c]-y[b])*(x[a]-x[b]);
        const double d3 = (x[a]-x[c])*(y[b]-y[c]) - (y[a]-y[c])*(x[b]-x[c]);
        for (i=0; i<nOut; i++) {
            if (t[i] > 0) continue;
            if (((x[b]-x[a])*(Y[i]-y[a]) - (y[b]-y[a])*(X[i]-x[a])) * d1 < 0) continue;
            if (((x[c]-x[b])*(Y[i]-y[b]) - (y[c]-y[b])*(X[i]-x[b])) * d2 < 0) continue;
            if (((x[a]-x[c])*(Y[i]-y[c]) - (y[a]-y[c])*(X[i]-x[c])) * d3 < 0) continue;
            t[i] = j+1;
        }
    }    
}
