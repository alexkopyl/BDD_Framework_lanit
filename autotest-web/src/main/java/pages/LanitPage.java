package pages;

import com.codeborne.selenide.SelenideElement;
import ru.lanit.at.web.annotations.Name;
import ru.lanit.at.web.pagecontext.WebPage;

import static com.codeborne.selenide.Selenide.$x;

@Name(value = "Lanit")
public class LanitPage extends WebPage {

    @Name("New Ticket")
    private SelenideElement newTicketBtn = $x("//a[@href='/tickets/submit/']");

    @Name("Queue")
    private SelenideElement fieldQueue = $x("//select[@id='id_queue']");

    @Name("Summary of the problem")
    private SelenideElement fieldTitle = $x("//input[@id='id_title']");

    @Name("Priority")
    private SelenideElement fieldPriority = $x("//select[@id='id_priority']");

    @Name("Your E-Mail Address")
    private SelenideElement fieldEmail = $x("//input[@id='id_submitter_email']");

    @Name("Submit Ticket")
    private SelenideElement submitTicketBtn = $x("//button[@type='submit']");

    @Name("Log in")
    private SelenideElement logInBtn = $x("//a[@href='/login/?next=/']");

    @Name("Username")
    private SelenideElement fieldUsername = $x("//input[@id='username']");

    @Name("Password")
    private SelenideElement fieldPassword = $x("//input[@id='password']");

    @Name("checkbox1")
    private SelenideElement checkBoxBtn1 = $x("//input[@value='remember-me']");

    @Name("Login")
    private SelenideElement loginBtn = $x("//input[@value='Login']");

    @Name("Search...")
    private SelenideElement fieldSearch = $x("//input[@aria-label='Search']");

    @Name("Go")
    private SelenideElement goBtn = $x("//button[@class='btn btn-primary']");

    @Name("title")
    private SelenideElement titleBtn = $x("//div[@class='tickettitle']");

    @Name("Edit")
    private SelenideElement editBtn = $x("//a[@class='ticket-edit']");

    @Name("Save Changes")
    private SelenideElement saveChangesBtn = $x("//input[@value='Save Changes']");

    @Name("Attach File(s)")
    private SelenideElement attachFilesBtn = $x("//button[@id='ShowFileUpload']");

    @Name("Browse...")
    private SelenideElement browseBtn = $x("//label[@class='btn btn-primary btn-sm btn-file']");

    @Name("file")
    private SelenideElement fileattach = $x("//input[@type='file']");

    @Name("Update This Ticket")
    private SelenideElement updateThisTicketBtn = $x("//button[@class='btn btn-primary float-right']");

    @Name("Save Query")
    private SelenideElement saveQueryBtn = $x("//i[@class='fas fa-save']");

    @Name("Query Name")
    private SelenideElement fieldQueryName = $x("//input[@id='id_title']");

    @Name("checkbox2")
    private SelenideElement checkBoxBtn2 = $x("//input[@id='id_shared']");

    @Name("Save Query Btn")
    private SelenideElement saveQueryBtnBtn = $x("//input[@value='Save Query']");
}
