const chromium = require('@sparticuz/chromium');
const puppeteer = require('puppeteer-core');

exports.handler = async (event) => {
    let browser = null;
    try {
        browser = await puppeteer.launch({
            args: chromium.args,
            defaultViewport: chromium.defaultViewport,
            executablePath: await chromium.executablePath(),
            headless: chromium.headless,
            ignoreHTTPSErrors: true,
        });

        const page = await browser.newPage();
        await page.goto('https://www.google.com');

        // Get the page title
        const title = await page.title();

        return { title };
    } catch (error) {
        throw new Error(`Failed to get page title: ${error}`);
    } finally {
        if (browser) {
            await browser.close();
        }
    }
};