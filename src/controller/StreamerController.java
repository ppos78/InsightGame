package controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import model.Clip;
import model.Schedule;
import service.IClipService;
import service.ITgdService;

@Controller
public class StreamerController {
	@Autowired
	IClipService clipService;
	@Autowired
	ITgdService tgdService;

	@RequestMapping("InsightStreamer.do")
	public String streamer(Model model) {
		System.out.println("여기는 스트리머페이지");
		return "pages/streamer";
	}

	@RequestMapping("searchStreamer.do")
	public String searchStreamer(Model model, @RequestParam(name = "searchSelect", required = true) String searchSelect,
			@RequestParam(name = "search", defaultValue = "") String search) {
		System.out.println("여기는 서치스트리머");
		model.addAttribute("what", search);
		return "pages/searchStreamer";
	}

	@RequestMapping("streamerRadar.do")
	public String streamerRadar(Model model) {
		System.out.println("스트리머 레이더차트");
		return "contents/streamerRadarChart";
	}

	@RequestMapping("streamerRank.do")
	public String streamerRank(Model model) {
		System.out.println("시간,팔로우,IRL/방송시간 기준으로 스트리머 랭크");
		return "contents/streamerRank";
	}

	@RequestMapping("hotClip.do")
	public String hotClip(Model model) {
		System.out.println("여기는 핫클립");
		List<Clip> list = clipService.getcliplist();
		// int random= (int)(Math.random()*4)+1;
		// System.out.println(random);

		// for(Clip c: list) {
		// System.out.println(c.toString());
		// }
		// model.addAttribute("random",random);
		//
		model.addAttribute("cliplist", list);
//		return "contents/hotclips";
		return "pages/streamer";
	}


	@RequestMapping("streamerBoardNumAsTime.do")//기존 버전
	public String streamerBoardNumAsTime(Model model) {
		System.out.println("시간에 따른 전체게시판/스트리머게시판 게시글 수");

		List<Integer> list = tgdService.gettgdlist();

		// for(Integer i :list) {
		// System.out.println(i);
		// }

		LocalDateTime now = LocalDateTime.now();
		LocalDateTime end = now.minusDays(14);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd yyyy");
		DateTimeFormatter month = DateTimeFormatter.ofPattern("MM");

		String fourteen = end.format(formatter);
		String month2 = end.format(month);

		int month3 = Integer.parseInt(month2);
		String month4="";

		switch (month3) {
			case 01:
				month4 = "January";
				break;
			case 02:
				month4 = "February";
				break;
		}

		String d=month4+" "+fourteen;
		
		model.addAttribute("d", d);
		model.addAttribute("tdglist", list);

		// return null;
		return "contents/streamerBoardNumAsTime";

	}

	@RequestMapping("streamerInterest.do")
	public String streamerInterest(Model model) {
		System.out.println("스트리머별 인기게임");
		return "contents/streamerInterest";
	}
	


}
