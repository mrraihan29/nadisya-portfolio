<script lang="ts">
	import { onMount } from 'svelte';
	import { gsap } from 'gsap';
	import { ScrollTrigger } from 'gsap/ScrollTrigger';

	let sectionRef: HTMLElement;
	let galleryRef: HTMLElement;

	// Portfolio images with editorial styling
	const portfolioImages = [
		{
			src: '/nadisya1.jpg',
			title: 'ETHEREAL DREAMS',
			category: 'EDITORIAL',
			year: '2024',
			size: 'large'
		},
		{
			src: '/nadisya2.jpg',
			title: 'URBAN POETRY',
			category: 'LIFESTYLE',
			year: '2024',
			size: 'medium'
		},
		{
			src: '/nadisya3.jpg',
			title: 'NATURAL GRACE',
			category: 'PORTRAIT',
			year: '2024',
			size: 'small'
		},
		{
			src: '/nadisya4.jpg',
			title: 'REFINED ELEGANCE',
			category: 'FASHION',
			year: '2024',
			size: 'medium'
		},
		{
			src: '/nadisya5.jpg',
			title: 'TIMELESS BEAUTY',
			category: 'EDITORIAL',
			year: '2024',
			size: 'large'
		},
		{
			src: '/nadisya6.jpg',
			title: 'MODERN MUSE',
			category: 'LIFESTYLE',
			year: '2024',
			size: 'small'
		},
		{
			src: '/nadisya7.jpg',
			title: 'ARTISTIC VISION',
			category: 'CREATIVE',
			year: '2024',
			size: 'medium'
		},
		{
			src: '/nadisya8.jpg',
			title: 'SERENE MOMENTS',
			category: 'PORTRAIT',
			year: '2024',
			size: 'small'
		},
		{
			src: '/nadisya9.jpg',
			title: 'FASHION FORWARD',
			category: 'FASHION',
			year: '2024',
			size: 'large'
		},
		{
			src: '/nadisya10.jpg',
			title: 'CREATIVE EXPRESSION',
			category: 'CREATIVE',
			year: '2024',
			size: 'medium'
		}
	];

	onMount(() => {
		gsap.registerPlugin(ScrollTrigger);

		// Staggered gallery animation
		gsap.fromTo(
			'.gallery-item',
			{
				y: 100,
				opacity: 0,
				scale: 0.95
			},
			{
				y: 0,
				opacity: 1,
				scale: 1,
				duration: 1.2,
				stagger: 0.15,
				ease: 'power3.out',
				scrollTrigger: {
					trigger: galleryRef,
					start: 'top 80%',
					toggleActions: 'play none none reverse'
				}
			}
		);

		// Title animation
		gsap.fromTo(
			'.section-number',
			{ x: -50, opacity: 0 },
			{
				x: 0,
				opacity: 1,
				duration: 1,
				ease: 'power2.out',
				scrollTrigger: {
					trigger: sectionRef,
					start: 'top 90%',
					toggleActions: 'play none none reverse'
				}
			}
		);

		// Hover effects
		const items = document.querySelectorAll('.gallery-item');
		items.forEach((item) => {
			const image = item.querySelector('.gallery-image');
			const info = item.querySelector('.image-info');

			item.addEventListener('mouseenter', () => {
				gsap.to(image, { scale: 1.05, duration: 0.8, ease: 'power2.out' });
				gsap.to(info, { y: -10, duration: 0.3, ease: 'power2.out' });
			});

			item.addEventListener('mouseleave', () => {
				gsap.to(image, { scale: 1, duration: 0.8, ease: 'power2.out' });
				gsap.to(info, { y: 0, duration: 0.3, ease: 'power2.out' });
			});
		});
	});
</script>

<section bind:this={sectionRef} class="gallery-section" id="work">
	<div class="gallery-container">
		<!-- Section header -->
		<div class="section-header">
			<div class="section-number">02</div>
			<div class="section-info">
				<h2 class="section-title">GALLERY</h2>
				<p class="section-description">
					A curated selection of editorial and fashion work showcasing versatility and artistic
					vision
				</p>
			</div>
		</div>

		<!-- Image gallery -->
		<div bind:this={galleryRef} class="image-gallery">
			{#each portfolioImages as image, index}
				<div class="gallery-item {image.size}" data-index={index}>
					<div class="image-container">
						<img src={image.src} alt={image.title} class="gallery-image" loading="lazy" />
						<div class="image-overlay">
							<div class="overlay-content">
								<span class="view-text">VIEW</span>
							</div>
						</div>
					</div>
					<div class="image-info">
						<div class="image-meta">
							<span class="image-category">{image.category}</span>
							<span class="image-year">{image.year}</span>
						</div>
						<h3 class="image-title">{image.title}</h3>
					</div>
				</div>
			{/each}
		</div>
	</div>
</section>

<style>
	.gallery-section {
		padding: var(--spacing-2xl) 0;
		background: var(--color-background);
		position: relative;
	}

	.gallery-container {
		max-width: var(--container-width);
		margin: 0 auto;
		padding: 0 2rem;
	}

	.section-header {
		display: flex;
		align-items: flex-start;
		gap: 3rem;
		margin-bottom: var(--spacing-xl);
		padding-bottom: 3rem;
		border-bottom: 1px solid var(--color-border);
	}

	.section-number {
		font-family: var(--font-sans);
		font-size: 1rem;
		font-weight: var(--font-weight-medium);
		color: var(--color-text-light);
		letter-spacing: 0.1em;
		flex-shrink: 0;
	}

	.section-info {
		flex: 1;
	}

	.section-title {
		font-family: var(--font-sans);
		font-size: clamp(3rem, 8vw, 8rem);
		font-weight: var(--font-weight-bold);
		line-height: 0.9;
		color: var(--color-text);
		margin-bottom: 1.5rem;
		text-transform: uppercase;
		letter-spacing: -0.02em;
	}

	.section-description {
		font-family: var(--font-sans);
		font-size: 1rem;
		font-weight: var(--font-weight-light);
		line-height: 1.6;
		color: var(--color-text-muted);
		max-width: 500px;
	}

	.image-gallery {
		display: grid;
		grid-template-columns: repeat(6, 1fr);
		grid-auto-rows: 200px;
		gap: 1.5rem;
		align-items: start;
	}

	.gallery-item {
		cursor: pointer;
		transition: var(--transition);
		position: relative;
		overflow: hidden;
		border-radius: 12px;
	}

	/* Artistic masonry layout */
	.gallery-item.large {
		grid-column: span 3;
		grid-row: span 3;
	}

	.gallery-item.medium {
		grid-column: span 2;
		grid-row: span 2;
	}

	.gallery-item.small {
		grid-column: span 2;
		grid-row: span 2;
	}

	/* Specific positioning for artistic layout */
	.gallery-item[data-index='0'] {
		grid-column: 1 / span 3;
		grid-row: 1 / span 3;
	}
	.gallery-item[data-index='1'] {
		grid-column: 4 / span 2;
		grid-row: 1 / span 2;
	}
	.gallery-item[data-index='2'] {
		grid-column: 6 / span 1;
		grid-row: 1 / span 1;
	}
	.gallery-item[data-index='3'] {
		grid-column: 4 / span 3;
		grid-row: 3 / span 2;
	}
	.gallery-item[data-index='4'] {
		grid-column: 1 / span 2;
		grid-row: 4 / span 3;
	}
	.gallery-item[data-index='5'] {
		grid-column: 3 / span 1;
		grid-row: 4 / span 1;
	}
	.gallery-item[data-index='6'] {
		grid-column: 5 / span 2;
		grid-row: 5 / span 2;
	}
	.gallery-item[data-index='7'] {
		grid-column: 3 / span 1;
		grid-row: 5 / span 1;
	}
	.gallery-item[data-index='8'] {
		grid-column: 1 / span 3;
		grid-row: 7 / span 3;
	}
	.gallery-item[data-index='9'] {
		grid-column: 4 / span 2;
		grid-row: 7 / span 2;
	}

	.image-container {
		position: relative;
		width: 100%;
		height: 100%;
		overflow: hidden;
		border-radius: 12px;
		background: var(--color-background-secondary);
	}

	.image-overlay {
		position: absolute;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		background: linear-gradient(135deg, rgba(240, 147, 251, 0.8), rgba(139, 92, 246, 0.8));
		opacity: 0;
		transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
		display: flex;
		align-items: center;
		justify-content: center;
		z-index: 2;
	}

	.overlay-content {
		text-align: center;
		transform: translateY(20px);
		transition: transform 0.4s cubic-bezier(0.4, 0, 0.2, 1);
	}

	.view-text {
		color: white;
		font-family: var(--font-sans);
		font-size: 0.9rem;
		font-weight: var(--font-weight-medium);
		letter-spacing: 0.2em;
		text-transform: uppercase;
	}

	.gallery-item:hover .image-overlay {
		opacity: 1;
	}

	.gallery-item:hover .overlay-content {
		transform: translateY(0);
	}

	.gallery-image {
		width: 100%;
		height: 100%;
		object-fit: cover;
		object-position: center;
		filter: grayscale(10%);
		transition: var(--transition);
	}

	.image-info {
		position: absolute;
		bottom: 0;
		left: 0;
		right: 0;
		padding: 1.5rem;
		background: linear-gradient(transparent, rgba(0, 0, 0, 0.7));
		color: white;
		transform: translateY(100%);
		transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
	}

	.gallery-item:hover .image-info {
		transform: translateY(0);
	}

	.image-meta {
		display: flex;
		justify-content: space-between;
		align-items: center;
		margin-bottom: 0.5rem;
	}

	.image-category,
	.image-year {
		font-family: var(--font-sans);
		font-size: 0.7rem;
		font-weight: var(--font-weight-medium);
		letter-spacing: 0.1em;
		color: rgba(255, 255, 255, 0.8);
		text-transform: uppercase;
	}

	.image-title {
		font-family: var(--font-sans);
		font-size: 1rem;
		font-weight: var(--font-weight-medium);
		color: white;
		letter-spacing: 0.05em;
		text-transform: uppercase;
		margin: 0;
		line-height: 1.2;
	}

	/* Theme-specific styles */
	:global([data-theme='vibrant']) .gallery-image {
		filter: none;
	}

	:global([data-theme='vibrant']) .section-number {
		color: rgba(255, 255, 255, 0.9);
		text-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
	}

	:global([data-theme='vibrant']) .section-title {
		color: rgba(255, 255, 255, 0.95);
		text-shadow: 0 2px 15px rgba(0, 0, 0, 0.3);
	}

	:global([data-theme='vibrant']) .section-description {
		color: rgba(255, 255, 255, 0.9);
		text-shadow: 0 1px 8px rgba(0, 0, 0, 0.2);
	}

	:global([data-theme='vibrant']) .image-title {
		color: rgba(255, 255, 255, 0.95);
		text-shadow: 0 1px 5px rgba(0, 0, 0, 0.2);
	}

	:global([data-theme='vibrant']) .image-category {
		color: rgba(255, 255, 255, 0.8);
		text-shadow: 0 1px 5px rgba(0, 0, 0, 0.1);
	}

	/* Mobile responsive */
	@media (max-width: 1024px) {
		.section-header {
			flex-direction: column;
			gap: 1.5rem;
		}

		.image-gallery {
			grid-template-columns: repeat(2, 1fr);
		}

		.gallery-item:nth-child(1),
		.gallery-item:nth-child(2),
		.gallery-item:nth-child(3),
		.gallery-item:nth-child(4) {
			grid-column: span 1;
			margin-top: 0;
		}

		.gallery-item:nth-child(odd) {
			margin-top: 2rem;
		}
	}

	@media (max-width: 768px) {
		.gallery-container {
			padding: 0 1rem;
		}

		.image-gallery {
			grid-template-columns: 1fr;
			gap: 1.5rem;
		}

		.gallery-item:nth-child(1),
		.gallery-item:nth-child(2),
		.gallery-item:nth-child(3),
		.gallery-item:nth-child(4) {
			grid-column: span 1;
			margin-top: 0;
		}

		.image-container {
			aspect-ratio: 4/5 !important;
		}

		.section-title {
			font-size: 3rem;
		}
	}

	/* Updated responsive for new masonry layout */
	@media (max-width: 1024px) {
		.image-gallery {
			grid-template-columns: repeat(4, 1fr);
			grid-auto-rows: 180px;
		}

		/* Simplified layout for tablets */
		.gallery-item[data-index='0'] {
			grid-column: 1 / span 2;
			grid-row: 1 / span 2;
		}
		.gallery-item[data-index='1'] {
			grid-column: 3 / span 2;
			grid-row: 1 / span 2;
		}
		.gallery-item[data-index='2'] {
			grid-column: 1 / span 1;
			grid-row: 3 / span 1;
		}
		.gallery-item[data-index='3'] {
			grid-column: 2 / span 2;
			grid-row: 3 / span 2;
		}
		.gallery-item[data-index='4'] {
			grid-column: 4 / span 1;
			grid-row: 3 / span 1;
		}
		.gallery-item[data-index='5'] {
			grid-column: 1 / span 2;
			grid-row: 4 / span 2;
		}
		.gallery-item[data-index='6'] {
			grid-column: 4 / span 1;
			grid-row: 4 / span 1;
		}
		.gallery-item[data-index='7'] {
			grid-column: 3 / span 2;
			grid-row: 5 / span 2;
		}
		.gallery-item[data-index='8'] {
			grid-column: 1 / span 2;
			grid-row: 6 / span 2;
		}
		.gallery-item[data-index='9'] {
			grid-column: 4 / span 1;
			grid-row: 5 / span 1;
		}
	}

	@media (max-width: 768px) {
		.image-gallery {
			grid-template-columns: repeat(2, 1fr);
			grid-auto-rows: 200px;
		}

		/* Simple 2-column layout for mobile */
		.gallery-item {
			grid-column: span 1 !important;
			grid-row: span 2 !important;
		}
	}

	@media (max-width: 480px) {
		.image-gallery {
			grid-template-columns: 1fr;
		}
	}
</style>
