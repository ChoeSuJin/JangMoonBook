package com.kosta.book.customer.board.service;

//?Ž˜?´ì§? ?‚˜?ˆ„ê¸? ê´?? ¨ ?ž‘?—… ?´?ž˜?Š¤

public class Pager {
		//?Ž˜?´ì§??‹¹ ê²Œì‹œë¬? ?ˆ˜
		public static final int PAGE_SCALE=15;
		//?™”ë©´ë‹¹ ?Ž˜?´ì§? ?ˆ˜
		public static final int BLOCK_SCALE=5;
		private int curPage; //?˜„?ž¬ ?Ž˜?´ì§?
		private int prevPage; //?´? „ ?Ž˜?´ì§?
		private int nextPage; //?‹¤?Œ ?Ž˜?´ì§?
		private int totPage; //? „ì²? ?Ž˜?´ì§? ê°??ˆ˜
		private int totBlock; //? „ì²? ?Ž˜?´ì§? ë¸”ë¡ ê°??ˆ˜
		private int curBlock; //?˜„?ž¬ ?Ž˜?´ì§? ë¸”ë¡
		private int prevBlock; //?´? „ ?Ž˜?´ì§? ë¸”ë¡
		private int nextBlock; //?‹¤?Œ ?Ž˜?´ì§? ë¸”ë¡
		private int pageBegin; //#{start}
		private int pageEnd; //#{end}
		private int blockBegin; //?˜„?ž¬ ?Ž˜?´ì§? ë¸”ë¡?˜ ?‹œ?ž‘ë²ˆí˜¸
		private int blockEnd;//?˜„?ž¬ ?Ž˜?´ì§? ë¸”ë¡?˜ ?ë²ˆí˜¸
		
		
		public Pager(int count, int curPage){
			curBlock=1; 
			this.curPage = curPage;
			setTotPage(count);	
			setPageRange(); 
			setTotBlock();		
			setBlockRange();
		}
		public void setBlockRange(){
		
			curBlock=(int)Math.ceil((curPage-1)/BLOCK_SCALE)+1;
			blockBegin=(curBlock-1)*BLOCK_SCALE+1;
			blockEnd=blockBegin+BLOCK_SCALE-1;
			if(blockEnd > totPage) blockEnd=totPage;
			prevPage=(curBlock==1)?1:(curBlock-1)*BLOCK_SCALE;
			nextPage=curBlock>totBlock?(curBlock*BLOCK_SCALE) : (curBlock*BLOCK_SCALE)+1;
			if(nextPage >= totPage) nextPage=totPage;
		}
		public void setPageRange(){	
			pageBegin=(curPage-1)*PAGE_SCALE+1;
			pageEnd=pageBegin + PAGE_SCALE-1;
		}
		//getter,setter
		public int getCurPage() {
			return curPage;
		}
		public void setCurPage(int curPage) {
			this.curPage = curPage;
		}
		public int getPrevPage() {
			return prevPage;
		}
		public void setPrevPage(int prevPage) {
			this.prevPage = prevPage;
		}
		public int getNextPage() {
			return nextPage;
		}
		public void setNextPage(int nextPage) {
			this.nextPage = nextPage;
		}
		public int getTotPage() {
			return totPage;
		}
		public void setTotPage(int count) {	
		  totPage = (int)Math.ceil(count*1.0 / PAGE_SCALE);
		}
		public int getTotBlock() {
			return totBlock;
		}
		public void setTotBlock() {
			totBlock=(int)Math.ceil(totPage / BLOCK_SCALE);
		}
		public int getCurBlock() {
			return curBlock;
		}
		public void setCurBlock(int curBlock) {
			this.curBlock = curBlock;
		}
		public int getPrevBlock() {
			return prevBlock;
		}
		public void setPrevBlock(int prevBlock) {
			this.prevBlock = prevBlock;
		}
		public int getNextBlock() {
			return nextBlock;
		}
		public void setNextBlock(int nextBlock) {
			this.nextBlock = nextBlock;
		}
		public int getPageBegin() {
			return pageBegin;
		}
		public void setPageBegin(int pageBegin) {
			this.pageBegin = pageBegin;
		}
		public int getPageEnd() {
			return pageEnd;
		}
		public void setPageEnd(int pageEnd) {
			this.pageEnd = pageEnd;
		}
		public int getBlockBegin() {
			return blockBegin;
		}
		public void setBlockBegin(int blockBegin) {
			this.blockBegin = blockBegin;
		}
		public int getBlockEnd() {
			return blockEnd;
		}
		public void setBlockEnd(int blockEnd) {
			this.blockEnd = blockEnd;
		}
	
}










