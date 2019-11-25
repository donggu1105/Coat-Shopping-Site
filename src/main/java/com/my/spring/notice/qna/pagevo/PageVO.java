package com.my.spring.notice.qna.pagevo;

public class PageVO {
    private Integer displayRowCount = 10;		//출력할 갯수
    private Integer rowStart;					//시작행번호
    private Integer rowEnd;						//종료번호
    private Integer totPage;					//전체페이지
    private Integer totRow = 0;					//전체페이지 수
    private Integer page;						//현재페이지
    private Integer pageStart;					//시작페이지
    private Integer pageEnd;					//종료페이지
    
//  @RequestParam(value="display" ,  required=false) Integer displayRowCount,
//	@RequestParam(value="rowstart" , required=false) Integer rowStart,
//	@RequestParam(value="rowend" , required=false) Integer rowEnd,
//	@RequestParam(value="totpage" , required=false) Integer totPage,
//	@RequestParam(value="totrow" , required=false) Integer totRow,
//	@RequestParam(value="page" , required=false) Integer page,
//	@RequestParam(value="pagestart" , required=false) Integer pageStart,
//	@RequestParam(value="pageend" , required=false) Integer pageEnd)

    public void pageCalculate(Integer total) {
        getPage();
        totRow  = total;
        totPage    = (int) ( total / displayRowCount );
        
        if ( total % displayRowCount > 0 ) {
            totPage++;
        }

        pageStart = (page - (page - 1) % displayRowCount) ;
        pageEnd = pageStart + 9;
        if (pageEnd > totPage) {
            pageEnd = totPage;
        }
        
        rowStart = ((page - 1) * displayRowCount) + 1 ;
        rowEnd   = rowStart + displayRowCount - 1;
    } 
    
    public Integer getPage() {
        if (page == null || page == 0) {
            page = 1;
        }
        
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getRowStart() {
        return rowStart;
    }

    public void setRowStart(Integer rowStart) {
        this.rowStart = rowStart;
    }

    public Integer getRowEnd() {
        return rowEnd;
    }

    public void setRowEnd(Integer rowEnd) {
        this.rowEnd = rowEnd;
    }

    public Integer getDisplayRowCount() {
        return displayRowCount;
    }

    public void setDisplayRowCount(Integer displayRowCount) {
        this.displayRowCount = displayRowCount;
    }

    public Integer getTotPage() {
        return totPage;
    }

    public void setTotPage(Integer totPage) {
        this.totPage = totPage;
    }

    public Integer getTotRow() {
        return totRow;
    }

    public void setTotRow(Integer totRow) {
        this.totRow = totRow;
    }

    public Integer getPageStart() {
        return pageStart;
    }

    public void setPageStart(Integer pageStart) {
        this.pageStart = pageStart;
    }

    public Integer getPageEnd() {
        return pageEnd;
    }

    public void setPageEnd(Integer pageEnd) {
        this.pageEnd = pageEnd;
    }

}