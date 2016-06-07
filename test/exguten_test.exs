defmodule ExgutenTest do
  use ExUnit.Case
  doctest Exguten
  alias Exguten.PDF
  alias Exguten.PDFLib
  alias Exguten.Xml2richText
  alias Exguten.Block

  @image_dir "./test/images/"

  test "new pdf" do
    base = 760
    increment = 12
    ptsize9 = 9
    tag_map_9 = Xml2richText.default_tagMap(ptsize9)
    ptsize10 = 10
    tag_map_10 = Xml2richText.default_tagMap(ptsize10)

    pid = PDF.new

    pid
    |> PDF.set_pagesize(:a4)
    |> PDF.set_page(1)
    |> PDF.set_dash([1])
    |> PDF.set_stroke_gray(0.5)
    |> PDF.set_line_width(1)
    |> PDF.round_rect({360, 705}, {210, 75}, 5)
    |> PDF.path(:stroke)
    |> PDF.set_font("Helvetica", 10)
    |> PDFLib.moveAndShow(370, base, "Account Number")
    |> PDFLib.moveAndShow(370, base - increment, "Billing date")
    |> PDFLib.moveAndShow(370, base - (increment * 2), "Total Amount Due")
    |> PDFLib.moveAndShow(370, base - (increment * 3), "Payment Due by")
    |> PDFLib.moveAndShow(470, base, "09588 355496-01-05")
    |> PDFLib.moveAndShow(470, base - increment, "02/28/10")
    |> PDFLib.moveAndShow(470, base - (increment * 2), "$99.95")
    |> PDFLib.moveAndShow(470, base - (increment * 3), "Page 1 of 2")
    |> PDF.set_dash(:solid)
    |> PDF.set_stroke_color(:dodgerblue)
    |> PDF.set_line_width(2)
    |> PDF.line(25, 700, 570, 700)
    |> PDF.image( @image_dir <> "comcast_logo.jpg", {25, 760}, {:height, 20})
    |> PDF.set_fill_gray(0.0)
    |> PDFLib.moveAndShow(30, 705, "Contact us:")
    |> PDFLib.moveAndShow(110, 705, "www.comcast.com")
    |> PDFLib.moveAndShow(220, 705, "1-800-391-3000")
    |> PDF.save_state
    |> PDF.set_fill_color(:orange)
    |> PDF.round_top_rect({320, 675}, {250, 20}, 10)
    |> PDF.path(:fill)
    |> PDF.restore_state
    |> PDF.save_state
    |> PDF.set_fill_color(:moccasin)
    |> PDF.rectangle(320, 620, 250, 55, :fill)
    |> PDF.restore_state
    |> PDF.save_state
    |> PDF.set_fill_color(:gainsboro)
    |> PDF.rectangle(320, 590, 250, 30, :fill)
    |> PDF.restore_state
    |> PDF.save_state
    |> PDF.set_fill_color(:orange)
    |> PDF.round_top_rect({320, 560}, {250, 20}, 10)
    |> PDF.path(:fill)
    |> PDF.restore_state
    |> PDF.save_state
    |> PDF.set_fill_color(:moccasin)
    |> PDF.rectangle(320, 540, 250, 20, :fill)
    |> PDF.restore_state
    |> PDF.save_state
    |> PDF.set_fill_color(:gainsboro)
    |> PDF.rectangle(320, 520, 250, 20, :fill)
    |> PDF.restore_state
    |> PDF.save_state
    |> PDF.set_fill_color(:yellowgreen)
    |> PDF.round_rect({320, 470}, {250, 40}, 20)
    |> PDF.path(:fill)
    |> PDF.restore_state
    |> PDF.image( @image_dir <> "high_speed_internet.jpg", {322, 543}, {:height, 15})
    |> PDF.set_fill_gray(1.0)
    |> PDF.set_font("Helvetica", 14)
    |> PDFLib.moveAndShow(325, 680, "Monthly Statement Summary")
    |> PDFLib.moveAndShow(325, 565, "New Charges Summary")
    |> PDF.set_fill_gray(0.0)
    |> PDF.set_font("Helvetica", 12)
    |> PDFLib.moveAndShow(25, 675, "SERVICE LEVEL CORP")
    |> PDF.set_font("Helvetica", 10)
    |> PDFLib.moveAndShow(25, 650, "For service at:")
    |> PDFLib.moveAndShow(25, 640, "7006 SUNCREST DR")
    |> PDFLib.moveAndShow(25, 630, "SALINE MI 48176-9102")
    |> PDF.set_font("Helvetica", 16)
    |> PDFLib.moveAndShow(25, 595, "News from Comcast")
    |> Block.block(xml(:news), 25, 585, 240, ptsize10, 12, 20, :ragged, tag_map_10)
    |> PDF.set_font("Helvetica-Bold", 10)
    |> PDFLib.moveAndShow(325, 610, "Total Amount Due")
    |> PDFLib.moveAndShow(565 -
       PDF.get_string_width(pid, "Helvetica", 12, "$99.95"), 610, "$99.95")
    |> PDF.set_font("Helvetica-Bold", 11)
    |> PDFLib.moveAndShow(325, 660, "Previous Balance")
    |> PDFLib.moveAndShow(325, 642, "Payment - 02/16/10 - thank you")
    |> PDFLib.moveAndShow(325, 627, "New Charges - see below")
    |> PDFLib.moveAndShow(325, 595, "Payment Due By")
    |> PDFLib.moveAndShow(340, 545, "Comcast High-Speed Internet")
    |> PDFLib.moveAndShow(325, 525, "Total New Charges")
    |> PDFLib.moveAndShow(565 - PDF.get_string_width(pid, "Helvetica", 12, "99.95"), 660, "99.95")
    |> PDFLib.moveAndShow(565 - PDF.get_string_width(pid, "Helvetica", 12, "-99.95"), 642, "-99.95")
    |> PDFLib.moveAndShow(565 - PDF.get_string_width(pid, "Helvetica", 12, "99.95"), 627, "99.95")
    |> PDFLib.moveAndShow(565 - PDF.get_string_width(pid, "Helvetica", 12, "03/22/10"), 595, "03/22/10")
    |> PDFLib.moveAndShow(565 - PDF.get_string_width(pid, "Helvetica", 12, "99.95"), 545, "99.95")
    |> PDFLib.moveAndShow(565 - PDF.get_string_width(pid, "Helvetica", 12, "$99.95"), 525, "$99.95")
    |> PDF.set_fill_gray(0.0)
    |> PDF.set_font("Helvetica", 14)
    |> show_centered(445, 498, "Helvetica", 14, "Thank you for being a")
    |> show_centered(445, 480, "Helvetica", 14, "valued Comcast customer")
    |> PDF.set_fill_gray(0.0)
    |> PDF.set_font("Helvetica", 8)
    |> PDFLib.moveAndShow(585, 500, "016604 1/1", 90)
    |> PDF.set_dash(:dot)
    |> PDF.set_stroke_color(:black)
    |> PDF.set_line_width(1)
    |> PDF.line(25, 255, 570, 255)
    |> show_centered(277, 240, "Helvetica", 8, "Detach and enclose this coupon with your payment. Please write your account number on your check or money order. Do not send cash.")
    |> PDF.image( @image_dir <> "comcast_logo.jpg", {50, 200}, {:height, 20})
    |> PDF.set_font("Helvetica", 8)
    |> PDFLib.moveAndShow(80, 180, "27800 FRANKLIN RD")
    |> PDFLib.moveAndShow(80, 170, "SOUTHFIELD MI 48034-2363")
    |> PDFLib.moveAndShow(55, 150, "------- manifest line -------")
    |> PDFLib.moveAndShow(55, 130, "SERVICE LEVEL CORP")
    |> PDFLib.moveAndShow(55, 120, "SUNCREST DRIVE")
    |> PDFLib.moveAndShow(55, 110, "SALINE MI 48176-9102")
    |> PDF.set_font("Helvetica-Bold", 10)
    |> PDFLib.moveAndShow(330, 220, "Account Number")
    |> PDFLib.moveAndShow(450, 220, "09588 234102-01-7")
    |> PDFLib.moveAndShow(330, 200, "Payment Due by")
    |> PDFLib.moveAndShow(450, 200, "04/15/10")
    |> PDFLib.moveAndShow(330, 180, "Total Amount Due")
    |> PDFLib.moveAndShow(450, 180, "$99.95")
    |> PDFLib.moveAndShow(330, 150, "Amount Enclosed")
    |> PDFLib.moveAndShow(450, 150, "$")
    |> PDF.set_dash(:solid)
    |> PDF.set_stroke_color(:black)
    |> PDF.set_line_width(1)
    |> PDF.line(330, 195, 550, 195)
    |> PDF.line(330, 175, 550, 175)
    |> PDF.line(455, 145, 550, 145)
    |> PDF.set_font("Helvetica", 10)
    |> PDFLib.moveAndShow(330, 130, "Make checks payable to Comcast")
    |> PDFLib.moveAndShow(350, 90,  "COMCAST")
    |> PDFLib.moveAndShow(350, 81,  "PO BOX 3005")
    |> PDFLib.moveAndShow(350, 72,  "SOUTHEASTERN PA")
    |> PDFLib.moveAndShow(350, 63,  "19398-3005")
    |> PDF.set_font("OCR-A-Digits", 10)
    |> PDFLib.moveAndShow(280, 15, "09588   234102 01 7       0       013135")
    |> PDF.new_page
    |> PDF.set_dash([1])
    |> PDF.set_stroke_gray(0.5)
    |> PDF.set_line_width(1)
    |> PDF.round_rect({360, 705}, {210, 75}, 5)
    |> PDF.path(:stroke)
    |> PDF.set_font("Helvetica", 10)
    |> PDFLib.moveAndShow(370, base, "Account Number")
    |> PDFLib.moveAndShow(370, base - increment, "Billing date")
    |> PDFLib.moveAndShow(370, base - (increment * 2), "Total Amount Due")
    |> PDFLib.moveAndShow(370, base - (increment * 3), "Payment Due by")
    |> PDFLib.moveAndShow(470, base, "09588 355496-01-05")
    |> PDFLib.moveAndShow(470, base - increment, "02/28/10")
    |> PDFLib.moveAndShow(470, base - (increment * 2), "$99.95")
    |> PDFLib.moveAndShow(470, base - (increment * 3), "Page 2 of 2")
    |> PDF.set_dash(:solid)
    |> PDF.set_stroke_color(:dodgerblue)
    |> PDF.set_line_width(2)
    |> PDF.line(25, 700, 570, 700)
    |> PDF.image( @image_dir <> "comcast_logo.jpg", {25, 760}, {:height, 20})
    |> PDF.set_fill_gray(0.0)
    |> PDFLib.moveAndShow(30, 705, "Contact us:")
    |> PDFLib.moveAndShow(110, 705, "www.comcast.com")
    |> PDFLib.moveAndShow(220, 705, "1-800-391-3000")
    |> PDFLib.moveAndShow(25, 735, "Service Details")
    |> PDF.image(@image_dir <> "high_speed_internet.jpg", {25, 665}, {:height, 25})
    |> PDF.save_state
    |> PDF.set_fill_color(:orange)
    |> PDF.round_rect({50, 665}, {250, 20}, 10)
    |> PDF.path(:fill)
    |> PDF.restore_state
    |> PDF.set_fill_gray(1.0)
    |> PDF.set_font("Helvetica", 12)
    |> PDFLib.moveAndShow( 55, 670, "Comcast High-Speed Internet")
    |> PDF.set_fill_gray(0.0)
    |> PDF.set_font("Helvetica", 10)
    |> PDFLib.moveAndShow( 25, 650, "Internet Preferred")
    |> PDFLib.moveAndShow( 40, 640, "Internet Preferred with")
    |> PDFLib.moveAndShow( 40, 630, "Microsoft Communication")
    |> PDFLib.moveAndShow( 40, 620, "Services")
    |> PDFLib.moveAndShow( 40, 610, "4 web access E-mailboxes,")
    |> PDFLib.moveAndShow( 40, 600, "domain name,")
    |> PDFLib.moveAndShow( 40, 590, "starter website,")
    |> PDFLib.moveAndShow( 25, 560, "CCO Static IP")
    |> PDFLib.moveAndShow( 25, 545, "PRO Modem")
    |> PDFLib.moveAndShow(180, 650, "03/08 - 04/07")
    |> PDFLib.moveAndShow(180, 560, "03/08 - 04/07")
    |> PDFLib.moveAndShow(180, 545, "03/08 - 04/07")
    |> show_adjust(300, 650, "Helvetica", 10, "89.95")
    |> show_adjust(300, 560, "Helvetica", 10, "10.00")
    |> show_adjust(300, 545, "Helvetica", 10, "0.00")
    |> PDF.set_font("Helvetica-Bold", 10)
    |> PDFLib.moveAndShow( 25, 525, "Total Comcast High-Speed Internet")
    |> show_adjust(300, 525, "Helvetica-Bold", 10, "$99.95")
    |> Block.block(xml(:online), 25, 235, 240, ptsize9, 12, 20, :ragged, tag_map_9)
    |> Block.block(xml(:caption), 310, 235, 240, ptsize9, 12, 20, :ragged, tag_map_9)
    |> PDF.export("./tmp/combell.pdf")
    |> PDF.stop
  end

  defp show_adjust(pid, positionx, positiony, fontname, fontsize, text) do
    PDFLib.moveAndShow(pid, positionx - PDF.get_string_width(pid, fontname, fontsize, text), positiony, text)
  end

  defp show_centered(pid, positionx, positiony, fontname, fontsize, text) do
    PDFLib.moveAndShow(pid, positionx - round(PDF.get_string_width(pid, fontname, fontsize, text) / 2), positiony, text)
  end

  def xml(:news) do
    "<p><hb>IMPORTANT INFORMATION</hb><helv> - Our network enhancement is complete! </helv></p>
    <p><helv> On 4/21/2010, any TV, including QAN tuner TVx, w\/o a Comcast
    Digital device will only be able to receive Limited Basic channels 2-24, 95,
    96 and 99. Just visit us online at comcast.com/digitnow or call us at 1-877-634-4434
    to get your equipment today.</helv></p><p><helv> All of us at Comcast extend our apreciation and thanks for being our
    customer, your opinion counts!!</helv></p> <p><helv>Please let us know any way we may better
    serve your needs.</helv></p>"
  end
  def xml(:online) do
    "<p><hb>Pay On-Line Using Your Credit Card Or From Your Bank Account:</hb></p>
     <p><helv>Pay your bill online with any major credit card or from your bank account at comcast.com.
     Simply click on \"Pay Your Bill Online\" from the comcast.com  homepage.</helv></p>
     <p>  </p>
     <p><hb>Automatic Bill Payments:</hb></p>
     <p><helv>Sign up for Comcast PayDirect and have your Comcast bill automatically paid from your bank account
     or charged to a credit card, on-time, every time. No more late payments or having to make a call.
     Click on \"Pay Your Bill Online\" from the comcast.com home page to sign up easily on-line.</helv></p>"
  end

  def xml(:caption) do
    "<p><helv>Closed Captioning: For immediate assistance call: (800)266-2278, fax (215)286-4700 or go online
     for email or live chat at www.comcast.com/support.
     For written complaints contact: Frank Eliason, Comcast Closed Captioning Office, 1701
     John F. Kennedy Blvd., Phila., PA 19103-2838, Captioning_Complaints@Comcast.com, fax:
     (215) 286-4700 or call:(215) 286-4697.</helv></p>
     <p>  </p>
     <p><hb>Franchise Authority Information:</hb></p>
     <p><helv>Pittsfield Township (MI0636)</helv></p>
     <p><helv>6201 W. Michigan Ave</helv></p>
     <p><helv>Ann Arbor MI, 48108</helv></p>"
  end
end
